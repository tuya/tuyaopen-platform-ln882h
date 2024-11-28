/****************************************************************************
 * @file port.h
 * @brief header file of port
 * @version <0.0.1>
 * @date 2022-05-16
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

#ifndef __PORT_H__
#define __PORT_H__


/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include "bl_config.h"

#include "tuya_boot_flash_table.h"
#include "tuya_boot_perip_handle.h"


#include "utils/wrap_stdio.h"
#include "utils/debug/log.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Public Type Declarations
 ****************************************************************************/


/****************************************************************************
 * Public Data
 ****************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

/*********************************** log ************************************/
// TODO, 获取平台串口初始化/raw 数据输出接口，此处逻辑可以统一掉
#if (CONFIG_ENABLE_DEBUG == 1)

void port_log_init(void);

void port_bl_log(const char *fmt, ...);

void port_log_deinit(void);

#else

#define port_log_init()
#define port_bl_log(...)
#define port_log_deinit()

#endif // TUYA_BL_DEBUG

/********************************** flash ***********************************/
int port_flash_init(void);
int port_flash_deinit(void);
int port_flash_read(uint32_t address, uint8_t *buf, uint32_t len);
int port_flash_write(uint32_t address, uint8_t *buf, uint32_t len);
int port_flash_erase(uint32_t address, uint32_t len);

/********************************* platform *********************************/
/* 平台初始化 */
void platform_init_hook(void);

/* 初始化完成后，如存在对时间有要求的逻辑
 * 或者需要配进行数据搬移等操作，可在此处处理 */
int platform_handle_after_startup(uint32_t address);

/* 外设保持功能相关接口，重设PWM / GPIO及操作其他外设 */
void platform_perip_handle_others(void);
void platform_handle_pwm(uint8_t pwm_num, struct pwm_ongoing *pwm);
void platform_handle_gpio(uint8_t gpio_num, struct gpio_ongoing *gpio);

/* ota区存储程序检测，某些情况下，ota区域可能会存储ATE、测试程序等，
 * 可以由boot直接跳转到这部分代码并执行 */
int platform_check_ota_program(struct ft_item_info *info, uint32_t *address);

/* OTA开始前/结束后，平台相关处理，如闪灯表示OTA开始/结束等 */
void platform_handle_before_ota(void);
void platform_handle_after_ota(int ota_result);

/* 跳转到指定地址并执行 */
void platform_do_jump(uint32_t address);

/* 芯片复位 */
void platform_system_reboot(void);

#ifdef __cplusplus
}
#endif

#endif /* !__PORT_H__ */
