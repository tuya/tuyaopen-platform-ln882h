/**
 * @file   ln_ty_ate.c
 * @author LightningSemi WLAN Team
 * Copyright (C) 2021-2021 LightningSemi Technology Co., Ltd. All rights reserved.
 *
 * Change Logs:
 * Date           Author       Notes
 * 2021-12-16     MurphyZhao   the first version
 */

#include <ctype.h>                  // isprint
#include <string.h>
#include <stdarg.h>
#include <stdint.h>

#include "ln_ty_ate.h"
#include "utils/debug/ln_assert.h"
#include "utils/system_parameter.h"
#include "ln_utils.h"
#include "osal/osal.h"
#include "utils/debug/log.h"
#include "serial/serial.h"
#include "wifi.h"

#include "hal/hal_gpio.h"
#include "ln_nvds.h"

#include "proj_config.h"
#include "wifi.h"

#include "tkl_uart.h"

#define ATE_UART_PORT TUYA_UART_NUM_0

#ifdef CFG_UART_BAUDRATE_CONSOLE
  #define ATE_CLI_BAUDRATE       CFG_UART_BAUDRATE_CONSOLE
#else
  #define ATE_CLI_BAUDRATE       (115200)
#endif

#define LN_TY_ATE_CLI_THR_PRI        OS_PRIORITY_HIGH
#define LN_TY_ATE_CLI_THR_STACK_SIZE (4*512)

#define LN_TY_ATE_CLI_CMD_BUFF_SIZE  (512)
#define LN_TY_ATE_CLI_LOG_BUFF_SIZE  (128)
#define LN_TY_ATE_CLI_CMD_END_MARK   ('\n')
#define ATE_OK_AND_SAVED_OK_STR      ("SAVE_FLASH_OK\r\n")
#define ATE_OK_AND_SAVED_FAIL_STR    ("SAVE_FLASH_FAIL\r\n")
#define ATE_CMD_FOUND                (0)
#define ATE_CMD_NOT_FOUND            (-1)
#define ATE_CMD_PRINT(fmt, ...)      ln_ty_ate_printf(fmt, ##__VA_ARGS__)

typedef struct cmd_tbl_s
{
    char *name;        /* Command Name */
    int maxargs;       /* maximum number of arguments */
    int (*cmd)(struct cmd_tbl_s *, int, const char *);
    char *usage;       /* Usage message	(short) */
} cmd_tbl_t;

static Serial_t sg_ate_cli_serial = { 0 };
static OS_Semaphore_t sg_ate_cli_rx_sem = { 0 };
static uint8_t *sg_ate_cli_cmd_buff_p = NULL;
static uint8_t *sg_ate_cli_log_buff_p = NULL;

static bool is_ate_complete_cmd(char * cmd_str);
static int ln_ty_ate_conn(const char *ssid, const char *pwd);
static int ln_ty_ate_uart_deinit(void);

static int do_get_sta_mac(cmd_tbl_t *cmd, int argc, const char *line)
{
    char *str = NULL;
    uint8_t mac[6];
    // LOG(LOG_LVL_INFO, "raw data:\r\n%s\r\n", line);
    // LOG(LOG_LVL_INFO, "[%s:%d] %s \thelp:\r\n%s\r\n",
    //         __func__, __LINE__, cmd->name, cmd->usage);

    if (SYSPARAM_ERR_NONE != sysparam_sta_mac_get(mac)) {
        ATE_CMD_PRINT("+mac FAIL\r\n");
    } else {
        ATE_CMD_PRINT("+mac OK mac:%02x:%02x:%02x:%02x:%02x:%02x\r\n",
                mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
    }

    return 0;
}

/**
 * SET_STA_MAC_ADDR=<addr>
*/
static int do_set_sta_mac(cmd_tbl_t *cmd, int argc, const char *line)
{
    char *str = NULL;
    uint8_t mac[6];

    // LOG(LOG_LVL_INFO, "raw data:\r\n%s\r\n", line);
    // LOG(LOG_LVL_INFO, "[%s:%d] %s \thelp:\r\n%s\r\n",
    //         __func__, __LINE__, cmd->name, cmd->usage);

    str = (char *)(line + strlen(cmd->name) + 1);
    if (strlen(str) <= 17) {
        ATE_CMD_PRINT("+mac FAIL\r\n");
        return -1;
    }

    str[17] = '\0';
    ln_mac_str2hex((const uint8_t *)str, mac);

    if (SYSPARAM_ERR_NONE != sysparam_sta_mac_update((const uint8_t *)mac)) {
        ATE_CMD_PRINT("+mac FAIL\r\n");
    } else {
        ATE_CMD_PRINT("+mac OK\r\n");
    }
    return 0;
}

static int do_get_ap_mac(cmd_tbl_t *cmd, int argc, const char *line)
{
    char *str = NULL;
    uint8_t mac[6];

    // LOG(LOG_LVL_INFO, "raw data:\r\n%s\r\n", line);
    // LOG(LOG_LVL_INFO, "[%s:%d] %s \thelp:\r\n%s\r\n",
    //         __func__, __LINE__, cmd->name, cmd->usage);

    if (SYSPARAM_ERR_NONE != sysparam_softap_mac_get(mac)) {
        ATE_CMD_PRINT("+mac FAIL\r\n");
    } else {
        ATE_CMD_PRINT("+mac OK mac:%02x:%02x:%02x:%02x:%02x:%02x\r\n",
                mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
    }

    return 0;
}

static int do_set_ap_mac(cmd_tbl_t *cmd, int argc, const char *line)
{
    char *str = NULL;
    uint8_t mac[6];

    // LOG(LOG_LVL_INFO, "raw data:\r\n%s\r\n", line);
    // LOG(LOG_LVL_INFO, "[%s:%d] %s \thelp:\r\n%s\r\n",
    //         __func__, __LINE__, cmd->name, cmd->usage);

    str = (char *)(line + strlen(cmd->name) + 1);
    if (strlen(str) <= 17) {
        ATE_CMD_PRINT("+mac FAIL\r\n");
        return -1;
    }

    str[17] = '\0';
    ln_mac_str2hex((const uint8_t *)str, mac);

    if (SYSPARAM_ERR_NONE != sysparam_softap_mac_update((const uint8_t *)mac)) {
        ATE_CMD_PRINT("+mac FAIL\r\n");
    } else {
        ATE_CMD_PRINT("+mac OK\r\n");
    }
    return 0;
}

/**
 * ATE_CONN="SSID","PWD"
*/
static int do_ate_conn(cmd_tbl_t *cmd, int argc, const char *line)
{
    char *ssid = NULL;
    char *pwd  = NULL;
    char *end  = NULL;
#define ATE_CONN_CMD_HEAD_STR "ATE_CONN=\""
#define ATE_CONN_CMD_PWD_SEPARATOR "\",\""

    (void)argc;

    if (NULL == strnstr(line, ATE_CONN_CMD_HEAD_STR, strlen(ATE_CONN_CMD_HEAD_STR))) {
        LOG(LOG_LVL_INFO, "L:%d\r\n", __LINE__);
        goto __exit;
    }
    ssid = (char *)(line + strlen(ATE_CONN_CMD_HEAD_STR));
    pwd = (char *)strstr(line, ATE_CONN_CMD_PWD_SEPARATOR);
    if (NULL == pwd) {
        LOG(LOG_LVL_INFO, "L:%d\r\n", __LINE__);
        goto __exit;
    }

    pwd[0] = '\0';
    pwd = (char *)(pwd + strlen(ATE_CONN_CMD_PWD_SEPARATOR));

    if (NULL != strstr(pwd, ATE_CONN_CMD_PWD_SEPARATOR)) {
        LOG(LOG_LVL_ERROR, "ssid and pwd does not include"
                           "the following string: "
                           ATE_CONN_CMD_PWD_SEPARATOR"\r\n");
        goto __exit;
    }

    if (NULL == (end = strchr(pwd, '\"'))) {
        LOG(LOG_LVL_INFO, "L:%d\r\n", __LINE__);
        goto __exit;
    }
    end[0] = '\0';

    LOG(LOG_LVL_INFO,"ssid:%s, pwd:%s\r\n", ssid, pwd);

    /* conn */
    if (0 == ln_ty_ate_conn(ssid, pwd)) {
        ATE_CMD_PRINT("+ate_conn OK\r\n");
        return 0;
    }

__exit:
    LOG(LOG_LVL_INFO, "raw data:\r\n%s\r\n", line);
    LOG(LOG_LVL_INFO, "%s\r\n\thelp:\r\n\t%s\r\n",
            cmd->name, cmd->usage);
    ATE_CMD_PRINT("+ate_conn FAIL\r\n");
    return -1;
}

static int do_ate_ble_start(cmd_tbl_t *cmd, int argc, const char *line)
{
    (void)cmd;
    (void)argc;
    (void)line;

    LOG(LOG_LVL_INFO, "Will jump to ble code area, can't jump back!\r\n");
    ATE_CMD_PRINT("+ate_ble_start OK\r\n");

    hal_misc_awo_set_r_idle_reg(0xaeaebebe);
    __NVIC_SystemReset();
    while(1);

    return 0;
}

static int do_ate_ok(cmd_tbl_t *cmd, int argc, const char *line)
{
    LOG(LOG_LVL_INFO, "raw data:\r\n%s\r\n", line);
    LOG(LOG_LVL_INFO, "[%s:%d] %s \thelp:\r\n%s\r\n",
            __func__, __LINE__, cmd->name, cmd->usage);

    is_ate_complete_cmd(line);
    return 0;
}

static int do_iperf(cmd_tbl_t *cmd, int argc, const char *line)
{
    wifi_sta_status_t status = WIFI_STA_STATUS_STARTUP;
    LOG(LOG_LVL_DEBUG, "raw data:\r\n%s\r\n", line);
    LOG(LOG_LVL_INFO, "iperf command\thelp:\r\n%s\r\n", cmd->usage);

    wifi_get_sta_status(&status);
    if (status != WIFI_STA_STATUS_CONNECTED) {
        LOG(LOG_LVL_INFO,
                "Note: device is not connected router!\r\n"
                "Can not start iperf ...\r\n");
        ATE_CMD_PRINT("+iperf FAIL\r\n");
        return -1;
    }

    if (0 != iperf(line)) {
        ATE_CMD_PRINT("+iperf FAIL\r\n");
        return -1;
    }

    ATE_CMD_PRINT("+iperf OK\r\n");
    return 0;
}

static int do_ate_reboot(cmd_tbl_t *cmd, int argc, const char *line)
{
    LOG(LOG_LVL_INFO, "line:%s,%d; name:%s,%d\r\n",
        line, strlen(line), cmd->name, strlen(cmd->name));

    if (!strstr(line, "=")) {
        goto __ln_reboot;
    }

    if (strstr(line, "=1")) {
        goto __ln_reboot;
    } else if (strstr(line, "=0")) {
        goto __nvic_reboot;
    } else {
        ATE_CMD_PRINT("+ate_reboot FAIL\r\n");
        ATE_CMD_PRINT("%s \thelp:\r\n%s\r\n",
            cmd->name, cmd->usage);
        return -1;
    }

__nvic_reboot:
    ATE_CMD_PRINT("+ate_reboot OK\r\n");
    OS_MsDelay(1000);
    __NVIC_SystemReset();
    return 0;

__ln_reboot:
    ATE_CMD_PRINT("+ate_reboot OK\r\n");
    OS_MsDelay(1000);
    ln_chip_reboot();
    return 0;
}
#if 0
#include "wifi_port.h"
static int do_ate_rf_cal_val_reset(cmd_tbl_t *cmd, int argc, const char *line)
{
    ATE_CMD_PRINT("+ate_rf_cal_val_reset OK\r\n");
    ATE_CMD_PRINT("Need reboot, please input ATE_REBOOT command.\r\n");

    return wlib_rf_cal_flag_set(0);
}

static int do_ate_rf_cal_val_save(cmd_tbl_t *cmd, int argc, const char *line)
{
    int ret = -1;
    uint8_t * cal_val = NULL;

    cal_val = (uint8_t *)wifi_rf_cal_val_get();

    if(cal_val == NULL)
    {
        uint8_t rf_cal_flag = 0;

        ATE_CMD_PRINT("Not yet calibrated!\r\n");
        wlib_rf_cal_flag_get(&rf_cal_flag);
        if(rf_cal_flag == 1)
        {
             ATE_CMD_PRINT("nvds have rf cal value\r\n");
        }
        else
        {
            ATE_CMD_PRINT("No calibration data in nvds!\r\n");
        }
        ret = -1;
    }
    else
    {
        ret = wlib_rf_cal_val_save(cal_val);
    }

    if (ret == 0)
    {
        wlib_rf_cal_flag_set(1);
        ATE_CMD_PRINT("+do_ate_rf_cal_val_save OK\r\n");
    }
    else
    {
        ATE_CMD_PRINT("+do_ate_rf_cal_val_save FAILED\r\n");
    }

    return ret;
}
#endif
static const cmd_tbl_t sg_cmd_list[] = {
    {"GET_STA_MAC_ADDR", 1, do_get_sta_mac, "eg: GET_STA_MAC_ADDR\r\n"},
    {"SET_STA_MAC_ADDR", 2, do_set_sta_mac, "eg: SET_STA_MAC_ADDR=<addr>\r\n"},
    {"GET_AP_MAC_ADDR",  1, do_get_ap_mac,  "eg: GET_AP_MAC_ADDR\r\n"},
    {"SET_AP_MAC_ADDR",  2, do_set_ap_mac,  "eg: SET_AP_MAC_ADDR=<addr>\r\n"},
    {"ATE_CONN",         2, do_ate_conn,    "eg: ATE_CONN=<\"ssid\"><,\"pwd\">\r\n"
                                            "Tip: Need to use double quotes\r\n"},
    {"ATE_BLE_START",    0, do_ate_ble_start, "eg: ATE_BLE_START\r\n"},
    {"ATE_OK",           2, do_ate_ok,      "eg: ATE_OK=<status>\r\n0:fail;1:succ\r\n"},
    {"iperf",            8, do_iperf,
            "client mode: iperf -c 192.168.1.100 -p 5001\r\n"
            "server mode: iperf -s\r\n"},
    {"ATE_REBOOT", 1, do_ate_reboot,
            "eg: ATE_REBOOT=<type>\r\n"
            "0:cm4-core-reset; 1:awo reset\r\n"},
    //{"ATE_RF_CAL_VAL_RESET", 0, do_ate_rf_cal_val_reset, "eg: ATE_RF_CAL_VAL_RESET\r\n"},
    //{"ATE_RF_CAL_VAL_SAVE", 0, do_ate_rf_cal_val_save, "eg: ATE_RF_CAL_VAL_SAVE\r\n"},
};

size_t ln_ty_ate_vprintf(const char *format, va_list args);

static const cmd_tbl_t *find_cmd (const char *cmd)
{
    const cmd_tbl_t *cmdtp = NULL;
    int i;

    for (i = 0; i < (sizeof(sg_cmd_list) / sizeof(sg_cmd_list[0])); i++) {
        cmdtp = &sg_cmd_list[i];
        if (strncasecmp(cmd, cmdtp->name, strlen(cmdtp->name)) == 0) {
            return cmdtp;   /* full match */
        }
    }

    return NULL;
}

#include "hal/hal_adc.h"
#include "drv_adc_measure.h"

static void wifi_temp_calibrate_timer_cb(void *arg)
{
    uint16_t adc_val = 0;
    int16_t curr_adc = 0;
    LN_UNUSED(arg);

    adc_val = drv_adc_read(ADC_CH0);
    wifi_do_temp_cal_period(adc_val);

    curr_adc = (adc_val & 0xFFF);
    static volatile uint8_t cnt = 0;
    cnt++;
    if ((cnt % 60) == 0) {
        LOG(LOG_LVL_INFO, "adc raw: %4d, temp_IC: %4d\r\n",
                curr_adc, (int16_t)(25 + (curr_adc - 750) / 2.54f));
    }
}
static OS_Timer_t s_wifi_temp_cal_timer = {0};

static int ln_ty_ate_conn(const char *ssid, const char *pwd)
{
    wifi_sta_connect_t conn           = {0};
    uint8_t mac_addr[MAC_ADDRESS_LEN] = {0};
    uint8_t psk_value[40]      = {0x0};
    wifi_scan_cfg_t scan_cfg = {
            .channel   = 0,
            .scan_type = WIFI_SCAN_TYPE_ACTIVE,
            .scan_time = 20,
    };

    if (ssid == NULL) {
        return -1;
    }

    conn.ssid  = (char *)ssid;
    conn.pwd   = (char *)((pwd == NULL) ? "" : pwd);
    conn.bssid = NULL;
    conn.psk_value = NULL;

    if (strlen(conn.pwd) != 0) {
        if (0 == ln_psk_calc(conn.ssid, conn.pwd, psk_value, sizeof(psk_value))) {
            conn.psk_value = psk_value;
        }
    }

    sysparam_sta_mac_get(mac_addr);
    netdev_set_mac_addr(NETIF_IDX_STA, mac_addr);
    netdev_set_active(NETIF_IDX_STA);
    wifi_sta_start(mac_addr, WIFI_NO_POWERSAVE);

    if (wifi_sta_connect(&conn, &scan_cfg) != 0)
    {
        LOG(LOG_LVL_ERROR, "[%s:%d]\r\n", __func__, __LINE__);
        return -1;
    }

    return 0;
}

static int ln_ty_ate_wifi_init(void)
{
#define NOT_CONNECTABLE_SSID ("NOT_CONNECTABLE_SSID_0XDEADBEEF")

    // rf preprocess,img cal
    wifi_rf_calibration();

    // init wifi
    wifi_init();
    wifi_manager_init();     // Creat wifi manager task

    // Start wifi temperature calibrate
    {
        int8_t cap_comp = 0;

        if (NVDS_ERR_OK == ln_nvds_get_xtal_comp_val((uint8_t *)&cap_comp)) {
            if ((uint8_t)cap_comp == 0xFF) {
                cap_comp = 0;
            }
        }

        drv_adc_init();
        wifi_temp_cal_init(drv_adc_read(ADC_CH0), cap_comp);

        if (LN_OS_OK != OS_TimerCreate(&s_wifi_temp_cal_timer, OS_TIMER_PERIODIC,
                wifi_temp_calibrate_timer_cb, NULL, 1000)) {
            LOG(LOG_LVL_ERROR, "create wifi temp calibrate timer failed.\r\n");
        } else {
            OS_TimerStart(&s_wifi_temp_cal_timer);
        }
    }

    return ln_ty_ate_conn(NOT_CONNECTABLE_SSID, NULL);

    return 0;
}

static void ln_ty_ate_cli_rx_cb(void)
{
    OS_SemaphoreRelease(&sg_ate_cli_rx_sem);
}

size_t ln_ty_ate_vprintf(const char *format, va_list args)
{
    uint32_t len = 0;
    int      ret = 0;

    if (sg_ate_cli_log_buff_p != NULL) {
        len = vsnprintf(sg_ate_cli_log_buff_p, LN_TY_ATE_CLI_LOG_BUFF_SIZE, format, args);
        //ret = serial_write(&sg_ate_cli_serial, (const void *)sg_ate_cli_log_buff_p, len);
        ret = tkl_uart_write(ATE_UART_PORT, (const void *)sg_ate_cli_log_buff_p, len);
    }

    return ret;
}

void ln_ty_ate_printf(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    ln_ty_ate_vprintf(format, args);
    va_end(args);
}

#include "tuya_cloud_types.h"
void __ln_ty_ate_cli_rx_cb(TUYA_UART_NUM_E port_id)
{
    OS_SemaphoreRelease(&sg_ate_cli_rx_sem);
    (void)port_id;
}

/**
 * SER_PORT_UART1 -> A2:TX; A3:RX
*/
static int ln_ty_ate_uart_init(void)
{
    Serial_t *fd = &sg_ate_cli_serial;

    if (LN_OS_OK != OS_SemaphoreCreate(&sg_ate_cli_rx_sem, 0, 512)) {
        return -1;
    }

    if (NULL == (sg_ate_cli_cmd_buff_p = OS_Malloc(LN_TY_ATE_CLI_CMD_BUFF_SIZE))) {
        goto __exit;
    }

    if (NULL == (sg_ate_cli_log_buff_p = OS_Malloc(LN_TY_ATE_CLI_LOG_BUFF_SIZE))) {
        goto __exit;
    }

    TUYA_UART_BASE_CFG_T cfg;

    cfg.baudrate = ATE_CLI_BAUDRATE;
    cfg.parity   = TUYA_UART_PARITY_TYPE_NONE;
    cfg.databits = TUYA_UART_DATA_LEN_8BIT;
    cfg.stopbits = TUYA_UART_STOP_LEN_1BIT;
    cfg.flowctrl = TUYA_UART_FLOWCTRL_NONE;

    tkl_uart_init(ATE_UART_PORT, &cfg);
    tkl_uart_rx_irq_cb_reg(ATE_UART_PORT, __ln_ty_ate_cli_rx_cb);
    //serial_init(fd, SER_PORT_UART1, ATE_CLI_BAUDRATE, ln_ty_ate_cli_rx_cb);
    return 0;

__exit:
    if (sg_ate_cli_cmd_buff_p != NULL) {
        OS_Free(sg_ate_cli_cmd_buff_p);
    }

    if (sg_ate_cli_log_buff_p != NULL) {
        OS_Free(sg_ate_cli_log_buff_p);
    }
    return -1;
}

static int ln_ty_ate_uart_deinit(void)
{
    Serial_t *fd = &sg_ate_cli_serial;
    serial_deinit(fd);
}

static int ate_cmd_parser(const char *line)
{
    int ret = ATE_CMD_FOUND;
    cmd_tbl_t *cmdtp;

    /* Look up command in command table */
    if ((cmdtp = (cmd_tbl_t *)find_cmd(line)) == 0) {
        // LOG(LOG_LVL_ERROR, "Unknown command: %s\r\n", line);
        ret = ATE_CMD_NOT_FOUND;
    } else if (cmdtp->cmd) {
        (cmdtp->cmd)(cmdtp, 0, line);
    }
    return ret;
}

static bool is_ate_complete_cmd(char * cmd_str)
{

    int8_t xtal_cap = 0, tx_power = 0;
    int8_t tx_pwr_b = 0, tx_pwr_gn = 0;
    char *str = NULL;
    int8_t val = 0;
    if ((str = strstr(cmd_str, "ATE_OK")) > 0) {
        if (strstr(str, "=1") > 0) {
            extern int ate_get_xtalcap_txpower_offset (int8_t *xtal_cap, int8_t *tx_power);
            extern int ate_get_xtalcap_calibration_info(void);
            extern int ate_get_txpower_calibration_info(void);
            extern int ate_is_calibrated_txpower_b(void);
            extern int ate_is_calibrated_txpower_gn(void);
            ate_get_xtalcap_txpower_offset(&xtal_cap, &tx_power);
            ate_get_txpower_b_gn_offset(&tx_pwr_b, &tx_pwr_gn);

            /* 1. save to nvds(flash) */
            // 1.1 save XTAL_CAP
            if (ate_get_xtalcap_calibration_info()) {
                ln_nvds_set_xtal_comp_val(xtal_cap);
                LOG(LOG_LVL_INFO, "ATE_OK, xtal cap:%d\r\n", xtal_cap);
            }

            // 1.2 save TX_POWER
            if (ate_get_txpower_calibration_info()) {
                ln_nvds_set_tx_power_comp(tx_power);
                LOG(LOG_LVL_INFO, "ATE_OK, tx power:%d\r\n", tx_power);
            }
            if (ate_is_calibrated_txpower_b()) {
                ln_nvds_set_tx_power_b_comp(tx_pwr_b);
                LOG(LOG_LVL_INFO, "ATE_OK, tx power_b:%d\r\n", tx_pwr_b);
            }
            if (ate_is_calibrated_txpower_gn()) {
                ln_nvds_set_tx_power_gn_comp(tx_pwr_gn);
                LOG(LOG_LVL_INFO, "ATE_OK, tx power_gn:%d\r\n", tx_pwr_gn);
            }

            // 1.3 save ATE result
            // ('S'=ate_successful, 'F'=ate_failed)
            ln_nvds_set_ate_result('S');
        }else if (strstr(str, "?") > 0) {
            ln_nvds_get_xtal_comp_val((uint8_t *)&val);
            ln_ty_ate_printf("+XTAL_COMP:%d\r\n", val);
            ln_nvds_get_tx_power_comp((uint8_t *)&val);
            ln_ty_ate_printf("+TXPOWER_COMP:%d\r\n", val);
            ln_nvds_get_tx_power_b_comp((uint8_t *)&val);
            ln_ty_ate_printf("+TXPOWER_B_COMP:%d\r\n", val);
            ln_nvds_get_tx_power_gn_comp((uint8_t *)&val);
            ln_ty_ate_printf("+TXPOWER_GN_COMP:%d\r\n", val);
            return true;
        }else {
            ln_nvds_set_ate_result('F');
        }

        /* 2.Response to instrument: SAVE_FLASH_OK\r\n */
        ln_ty_ate_printf("SAVE_FLASH_OK\r\n");

        return true;
    }

    return false;
}

static void ate_cli_thr_entry(void *arg)
{
    int ret = 0;
    Serial_t *port = &sg_ate_cli_serial;
    int len = 0;
    uint8_t ch;
    uint16_t counter = 0;

    LN_UNUSED(arg);

    while(1)
    {
        if (0 != OS_SemaphoreWait(&sg_ate_cli_rx_sem, OS_WAIT_FOREVER)) continue;

        do
        {
            len = tkl_uart_read(ATE_UART_PORT, &ch, 1);
            if((len > 0) &&
                (isprint(ch) || (ch == LN_TY_ATE_CLI_CMD_END_MARK) ||
                (ch == '\r')))
            {
                // LOG(LOG_LVL_INFO, "++++[%c]\r\n", ch);
                sg_ate_cli_cmd_buff_p[counter++] = ch;
                if (counter >= LN_TY_ATE_CLI_CMD_BUFF_SIZE) {
                    counter = 0;
                    continue;
                }

                if (ch == LN_TY_ATE_CLI_CMD_END_MARK) {
                    sg_ate_cli_cmd_buff_p[counter] = '\0';

                    if (ATE_CMD_NOT_FOUND == ate_cmd_parser(sg_ate_cli_cmd_buff_p))
                    {
                        // if (!is_ate_complete_cmd(sg_ate_cli_cmd_buff_p))
                        {
                            // rm CRLF
                            if (sg_ate_cli_cmd_buff_p[counter-1] == '\n') {
                                sg_ate_cli_cmd_buff_p[counter-1] = '\0';
                                counter--;
                            }

                            if (sg_ate_cli_cmd_buff_p[counter-1] == '\r') {
                                sg_ate_cli_cmd_buff_p[counter-1] = '\0';
                                counter--;
                            }

                            if(0 != wifi_private_command(sg_ate_cli_cmd_buff_p)) {
                                LOG(LOG_LVL_ERROR, "send pvt cmd failed!\r\n");
                            }
                        }
                    }
                    counter = 0;
                    memset(sg_ate_cli_cmd_buff_p, 0x0, LN_TY_ATE_CLI_CMD_BUFF_SIZE);
                }
            }
        } while(len != 0);
    }

__exit:
    OS_ThreadDelete(NULL);
}

bool ln_ty_ate_mode_check(void)
{
#ifdef FORCE_ENTER_ATE
    LOG(LOG_LVL_INFO, "Force enter ATE mode!\r\n");
    return true;
#else
    volatile uint8_t ret = 0;
    volatile uint32_t last_time = OS_GetTicks();
    do {
        if (HAL_RESET == (ret = hal_gpio_pin_input_read(GPIOA_BASE, GPIO_PIN_9))) {
            LOG(LOG_LVL_INFO, "GPIOA_9 low level, will enter ATE mode!\r\n");
            return true;
        }
    } while((OS_GetTicks() - last_time) <= 20);

    LOG(LOG_LVL_INFO, "GPIOA_9 high level, will enter Normal mode!\r\n");
    return false;
#endif
}

/**
 * @brief ln_ty_ate_main
 * @return -1: Failed to enter ate mode;
 *          0: Successfully entered ate mode.
*/
#include "utils/power_mgmt/ln_pm.h"
int ln_ty_ate_main(ate_mode_check_pfn cb)
{
    int ret = 0;
    OS_Thread_t ate_cli_thr = { 0 };
    LN_ASSERT(cb);

    if (false == cb()) {
        return -1;
    }

#ifndef ENABLE_LN_LWIP
    TUYA_LwIP_Init();
#endif // ENABLE_LN_LWIP

    ln_pm_always_clk_disable_select(CLK_G_I2S | CLK_G_WS2811 |
                                    CLK_G_SDIO | CLK_G_AES);
    ln_pm_always_clk_disable_select(CLK_G_GPIOA | CLK_G_GPIOB |
                                        CLK_G_SPI0 | CLK_G_SPI1 | CLK_G_I2C0 |
                                        CLK_G_WDT |
                                        CLK_G_TIM_REG | CLK_G_TIM1 | CLK_G_TIM2 |
                                        CLK_G_TIM4 | CLK_G_DMA |
                                        CLK_G_TRNG);

    if (0 != ln_ty_ate_wifi_init()) {
        return -1;
    }

    if (0 != (ret = ln_ty_ate_uart_init())) {
        return -1;
    }

    if (LN_OS_OK != OS_ThreadCreate(&ate_cli_thr, "cli",
            ate_cli_thr_entry, NULL,
            LN_TY_ATE_CLI_THR_PRI, LN_TY_ATE_CLI_THR_STACK_SIZE)) {
        return -1;
    }

    wlib_pvtcmd_output_cb_set(ln_ty_ate_vprintf);
    LOG(LOG_LVL_INFO, "Enter ATE mode!\r\n");

    return 0;
}

int ln_ty_ate_uart_test_use_start(void)
{
    int ret = 0;
    OS_Thread_t ate_cli_thr = { 0 };

    if (0 != (ret = ln_ty_ate_uart_init())) {
        return -1;
    }

    if (LN_OS_OK != OS_ThreadCreate(&ate_cli_thr, "cli",
            ate_cli_thr_entry, NULL,
            LN_TY_ATE_CLI_THR_PRI, LN_TY_ATE_CLI_THR_STACK_SIZE)) {
        return -1;
    }

    wlib_pvtcmd_output_cb_set(ln_ty_ate_vprintf);

    return 0;
}
