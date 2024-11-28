#include "osal/osal.h"
#include "utils/debug/log.h"
#include "utils/reboot_trace/reboot_trace.h"
#include "hal/hal_wdt.h"
#include "ln_nvds.h"
#include "ln_utils.h"

#include "wifi_manager.h"
#include "wifi.h"

#include "usr_app.h"
#include "usr_ble_app.h"
#include "ln_ty_ate.h"
#include "ln_ty_sdk_version.h"
// #include "utilities/uni_log.h"
#include "tuya_iot_config.h"

#define USR_WORK_THREAD_STACK_SIZE   6*256 //Byte

#include "utils/debug/ln_assert.h"
#include "freertos_common.h"

#include "ln_kv.h"
#include "ln_kv_api.h"
#include "ln_kv_key_def.h"
#include "ln_misc.h"

#include "proj_config.h"

static OS_Thread_t g_ble_app_thread;
#define BLE_APP_TASK_STACK_SIZE         (1024*2)
static OS_Thread_t g_monitor_app_thread;
#define MONITOR_APP_TASK_STACK_SIZE     (1024)

#define HEAP_TOTAL_LEN    (&heap0_len)

static uint8_t mac_addr[6] = {
    LN_BLE_MAC_ADDR0,
    LN_BLE_MAC_ADDR1,
    LN_BLE_MAC_ADDR2,
    LN_BLE_MAC_ADDR3,
    LN_BLE_MAC_ADDR4,
    LN_BLE_MAC_ADDR5
};

static uint8_t mac_addr_reverse[6] = {
    LN_BLE_MAC_ADDR5,
    LN_BLE_MAC_ADDR4,
    LN_BLE_MAC_ADDR3,
    LN_BLE_MAC_ADDR2,
    LN_BLE_MAC_ADDR1,
    LN_BLE_MAC_ADDR0
};

void ln_load_config_info(void)
{
    //1. load mac
    int value_len = 0;
    if (ln_kv_has_key(KV_BLE_MAC)) {
        if (KV_ERR_NONE != ln_kv_get(KV_BLE_MAC, (void *)mac_addr, sizeof(mac_addr), (size_t *)&value_len))
        {
            LOG(LOG_LVL_ERROR, "get mac from kv error!\r\n");
        }
    } else {
        LOG(LOG_LVL_INFO, "mac kv never set!\r\n");
        if (mac_addr[0] == LN_BLE_MAC_ADDR0 &&
            mac_addr[1] == LN_BLE_MAC_ADDR1 &&
            mac_addr[2] == LN_BLE_MAC_ADDR2 &&
            mac_addr[3] == LN_BLE_MAC_ADDR3 &&
            mac_addr[4] == LN_BLE_MAC_ADDR4 &&
            mac_addr[5] == LN_BLE_MAC_ADDR5){
            ln_generate_random_mac(mac_addr);
        }
        if (KV_ERR_NONE != ln_kv_set(KV_BLE_MAC, (void *)&mac_addr, sizeof(mac_addr)))
        {
            LOG(LOG_LVL_ERROR, "set mac to kv error!\r\n");
        }
    }

    mac_addr_reverse[0] = mac_addr[5];
    mac_addr_reverse[1] = mac_addr[4];
    mac_addr_reverse[2] = mac_addr[3];
    mac_addr_reverse[3] = mac_addr[2];
    mac_addr_reverse[4] = mac_addr[1];
    mac_addr_reverse[5] = mac_addr[0];

    LOG(LOG_LVL_INFO, "ble mac[%02x:%02x:%02x:%02x:%02x:%02x]\r\n",
                        mac_addr[0], mac_addr[1], mac_addr[2],
                        mac_addr[3], mac_addr[4], mac_addr[5]);
}

uint8_t *ln_get_mac_array(bool reverse)
{
    if (reverse) {
        return mac_addr_reverse;
    } else {
        return mac_addr;
    }
}

#if (ENABLE_RTC == 1)
extern uint8_t platform_rtc_cal(void);
#endif

static void dump_task_stack_info(void)
{
    static UBaseType_t   s_arraySize = 0;
    static TaskStatus_t  *s_task_status_array_p = NULL;
    uint32_t      FreeRTOSRunTimeTicks = 0;
    UBaseType_t   cnt = 0;

    static uint8_t is_runned = 0;

    if (is_runned == 0) {
        s_arraySize = uxTaskGetNumberOfTasks() + 5;
        s_task_status_array_p = pvPortMalloc(s_arraySize * sizeof(TaskStatus_t));
        LOG(LOG_LVL_ERROR, "num:%d,alloc size:%d\r\n", s_arraySize, s_arraySize * sizeof(TaskStatus_t));

        if (s_task_status_array_p != NULL) {
            is_runned = 1;
        } else {
            return;
        }
    }

    if (is_runned == 1) {
        UBaseType_t size = uxTaskGetNumberOfTasks();
        if (size > s_arraySize) {
            size = s_arraySize;
        }
        cnt = uxTaskGetSystemState(
                        (TaskStatus_t *)s_task_status_array_p,
                        (UBaseType_t)size,
                        (uint32_t *)&FreeRTOSRunTimeTicks);

        LOG(LOG_LVL_INFO,"\r\n================================================================\r\n");
        LOG(LOG_LVL_INFO,
                "TaskName    Priority    TaskNumber    MinStk    tick   CurrentState\r\n");
        for(int x = 0; x < cnt; x++) {
            LOG(LOG_LVL_INFO,
                "%8.8s    %02d          %02d            %06d    %ld     %d\r\n",
                s_task_status_array_p[x].pcTaskName,
                (int)s_task_status_array_p[x].uxCurrentPriority,
                (int)s_task_status_array_p[x].xTaskNumber,
                (int)s_task_status_array_p[x].usStackHighWaterMark * sizeof(StackType_t),
                (int)((float)s_task_status_array_p[x].ulRunTimeCounter/FreeRTOSRunTimeTicks*100),
                (int)s_task_status_array_p[x].eCurrentState);
        }
        LOG(LOG_LVL_INFO,"================================================================\r\n");
    }
}

#include "tkl_wifi.h"
static void usr_work_task_entry(void *arg)
{
    uint8_t cnt = 0;
    LN_UNUSED(arg);
    uint8_t delay_cnt = 0;
    // Delay output of necessary logs
    OS_MsDelay(2000);
//#if (ENABLE_RTC == 1)
//    tuya_rtc_init();
//#endif
    {
        /**
         * Note: chip-en connected to GND means power-down!!!
        */
        LOG(LOG_LVL_INFO, "reboot type(0:power-on;1:soft-rst;2:wdt-rst): %d\r\n",
                ln_chip_get_reboot_cause());

        /**
         * s_hw_reboot_cnt:
         *     Statistics of restart times without power-down.
         * Note: chip-en connected to GND means power-down!!!
        */
        LOG(LOG_LVL_INFO, "reboot count: %d\r\n", usr_reboot_cnt_get());

        LOG(LOG_LVL_INFO, "[ln_ty_sdk_ver: %s or 0x%08x] [build time:%s]\r\n",
            LN_TY_SDK_VERSION_STRING, LN_TY_SDK_VERSION, LN_TY_SDK_BUILD_DATE_TIME);

        LOG(LOG_LVL_INFO, "[Git info: %s]\r\n", LN_TY_SDK_GIT_INFO);

        LOG(LOG_LVL_INFO, "[BLIB Ver: %s or 0x%08x] [build time:%s]\r\n",
                ble_lib_version_string_get(),
                ble_lib_version_number_get(),
                ble_lib_build_time_get());
    }
    extern void *heap0_len;
    extern void ln_main_stack_attr_get(uint8_t **start_addr, size_t *size);

    uint8_t *stack_start_addr = NULL;
    size_t   stack_size = 0;
    ln_main_stack_attr_get(&stack_start_addr, &stack_size);

    extern OPERATE_RET tkl_adc_init(TUYA_ADC_NUM_E port_num, TUYA_ADC_BASE_CFG_T *cfg);
    extern OPERATE_RET tkl_adc_read_single_channel(TUYA_ADC_NUM_E port_num, uint8_t ch_id, int32_t *data);
    int adc = 0;
    TUYA_ADC_BASE_CFG_T cfg;
    cfg.freq = 1000;
    //tkl_adc_init(0, &cfg);

    while(1)
    {
        if ((delay_cnt % 5) == 0)
        {
            //tkl_adc_read_single_channel(0, 0, &adc);

            //LOG(LOG_LVL_INFO,
                //"Total:%ld; Free:%ld; main stack:%ld; adc: %d\r\n",
                //(size_t)HEAP_TOTAL_LEN, OS_GetFreeHeapSize(), stack_size, adc);
            //dump_task_stack_info();
        }

#if (ENABLE_RTC == 1)
        {
             platform_rtc_cal();
        }
#endif
        OS_MsDelay(1000);
        delay_cnt++;
    }

    OS_ThreadDelete(NULL);
}

#define LN_SELF_NORMAL_ADD_ATE_UART (0)

#if (LN_SELF_ATE_TEST_MODE == 1)
bool self_test_ty_ate_mode_check(void)
{
    return true;
}
#endif // LN_SELF_ATE_TEST_MODE == 1

#include "tuya_cloud_types.h"
extern void tuya_app_main(void);

static void ty_main_task_entry(void *arg)
{
    LN_UNUSED(arg);

    {
        extern void *heap0_len;
        extern void ln_main_stack_attr_get(uint8_t **start_addr, size_t *size);

        uint8_t *stack_start_addr = NULL;
        size_t   stack_size = 0;
        ln_main_stack_attr_get(&stack_start_addr, &stack_size);

        LOG(LOG_LVL_INFO,
                "Before enter tuya_main, Total:%ld; Free:%ld\r\n",
                (size_t)HEAP_TOTAL_LEN, OS_GetFreeHeapSize());

    }

#if (LN_SELF_ATE_TEST_MODE == 1)
    LOG(LOG_LVL_INFO, "Enter ate mode!\r\n");
    ln_nvds_set_ate_result(NV9_ATE_RESULT_OK);
    ln_ty_ate_main(self_test_ty_ate_mode_check);
#elif (LN_SELF_NORMAL_ADD_ATE_UART == 1)
    LOG(LOG_LVL_INFO, "Enter Normal mode, but have ate uart cmd!\r\n");
    tuya_app_main();
    extern int ln_ty_ate_uart_test_use_start(void);
    ln_ty_ate_uart_test_use_start();
#else
    if (0 != ln_ty_ate_main(ln_ty_ate_mode_check)) {
        LOG(LOG_LVL_INFO, "Failed to enter ate mode! Start tuya user main.\r\n");
        tuya_app_main();
    }
#endif // !(LN_SELF_ATE_TEST_MODE && LN_SELF_NORMAL_ADD_ATE_UART)


    OS_ThreadDelete(NULL);
}

void creat_usr_app_task(void)
{
    /**
     * create init task
    */
    {
        OS_Thread_t work_task = {0};
        if(LN_OS_OK != OS_ThreadCreate(&work_task, "worker",
            usr_work_task_entry, NULL,
            OS_PRIORITY_BELOW_NORMAL, USR_WORK_THREAD_STACK_SIZE)) {
            LOG(LOG_LVL_ERROR, "Failed to create cal task!\r\n");
        }
    }

    /**
     * create tuya main task
    */
    {
#define TY_MAIN_TASK_STACK_SIZE (4 * 1024)
        OS_Thread_t ty_main_thr = {0};
        if(LN_OS_OK != OS_ThreadCreate(&ty_main_thr, "ty_main", ty_main_task_entry,
            NULL, OS_PRIORITY_NORMAL, TY_MAIN_TASK_STACK_SIZE)) {
            LOG(LOG_LVL_ERROR, "Failed to create TY task!\r\n");
        }
    }
}

void ln_wdt_start(void)
{
    wdt_init_t_def wdt_init;
    memset(&wdt_init, 0, sizeof(wdt_init));
    wdt_init.wdt_rmod = WDT_RMOD_1;
    wdt_init.wdt_rpl = WDT_RPL_32_PCLK;
    wdt_init.top = WDT_TOP_VALUE_10;
    hal_wdt_init(WDT_BASE, &wdt_init);

    NVIC_EnableIRQ(WDT_IRQn);

    hal_wdt_en(WDT_BASE, HAL_ENABLE);
    hal_wdt_cnt_restart(WDT_BASE);
}

void WDT_IRQHandler()
{
}
