/****************************************************************************
 * @file tuya_boot_main.c
 * @brief this module is used to tuya_boot_main
 * @version 0.0.1
 * @date 2022-05-16
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/
#include "stdlib.h"

#include "tuya_boot.h"
#include "tuya_boot_conf.h"
#include "tuya_boot_jump.h"
#include "tuya_boot_ota.h"
#include "tuya_boot_flash_table.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Private Type Declarations
 ****************************************************************************/

static volatile uint32_t g_param_address = 0;

/****************************************************************************
 * Private Data Declarations
 ****************************************************************************/

/****************************************************************************
 * Private Functions
 ****************************************************************************/
static int __bl_misc_init(void)
{
    platform_init_hook();
    port_log_init();

    return port_flash_init();
}

static int call_platform_after_startup(void)
{
    int ret = platform_handle_after_startup((uint32_t)call_platform_after_startup);
    return ret;
}

static void __bl_handle_peripheral(void)
{
    int ret = 0;
    uint8_t val[16];

    // 读取外设参数配置项
    ret = bl_get_conf_val("perip_param", val, sizeof(val));
    if (ret != TY_BL_OK) {
        return;
    }

    g_param_address = strtol((const char *)val, NULL, 16);
    // 校验数据并将外设初始化为指定状态
    bl_peripheral_status_keep(g_param_address);
}

static int __bl_exec_ota_partition(struct ft_item_info *info)
{
    uint32_t address = 0;
    if (platform_check_ota_program(info, &address) == 0) {
        bl_exec(address);
    }

    return 0;
}
/**
 * @brief clean up resource to avoid reentrant
 *
 */
static void __bl_clean_resource(void)
{
    // 擦除数据，避免重入

    // 外设参数区擦除
    bl_peripheral_remove();
    if (g_param_address != 0) {
        port_flash_erase(g_param_address, 4096);
    }

    port_flash_deinit();
}

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/
int main(int argc, char *argv[])
{
    int ret = 0;
    struct ft_item_info ota_info;

    // 初始化
    ret = __bl_misc_init();
    if (ret != TY_BL_OK) {
        bl_printf("bootloader init error, %d\r\n", ret);
        goto exec_app;
    }

    bl_printf("\r\nbootloader build time: %s\r\n", __TIME__);

    // 平台相关处理
    ret = call_platform_after_startup();
    if (ret != TY_BL_OK) {
        bl_printf("platform error, %d\r\n", ret);
        goto exec_app;
    }

    // 配置文件
    ret = bl_conf_init();
    if (ret != TY_BL_OK) {
        bl_printf("read configuration error, %d\r\n", ret);
        goto exec_app;
    }

    // 外设状态保持
    __bl_handle_peripheral();

    // 分区表初始化
    ret = bl_flash_table_init();
    if (ret != TY_BL_OK) {
        // TODO
    }

    // OTA分区检测，若存在可执行程序，则跳转执行
    if (bl_lookup_flash_table("ota", &ota_info) == TY_BL_OK) {
        __bl_exec_ota_partition(&ota_info);
    }

    ret = bl_do_upgrade(&ota_info);
    if (ret == TY_BL_OK) {
        __bl_clean_resource();
        platform_handle_after_ota(ret);
    }

exec_app:
    bl_exec_app();

    // should not reach here
    while(1);

    unused_param(argc);
    unused_param(argv);
    // for clean warning
    return 0;
}



