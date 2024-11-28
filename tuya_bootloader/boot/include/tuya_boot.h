/****************************************************************************
 * @file tuya_boot_main.h
 * @brief header file of tuya_boot_main
 * @version <0.0.1>
 * @date 2022-05-16
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

#ifndef __TUYA_BOOT_H__
#define __TUYA_BOOT_H__


/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <stdint.h>
#include "bl_config.h"
#include "port.h"
#include "heap.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/
#ifndef CONFIG_TUYA_CONFIG_ADDRESS
#error CONFIG_TUYA_CONFIG_ADDRESS not defined
#endif

#if (CONFIG_TUYA_CONFIG_ADDRESS == 0)
#error TUYA_CONFIG_ADDRESS ERROR, Should not be 0.
#endif

#define __bl_weak_func __attribute__((weak))
#define unused_param(x) (void)x

#define bl_printf(...) port_bl_log(__VA_ARGS__)

#define PACK_4 __attribute__ ((packed, aligned(4)))
/****************************************************************************
 * Public Type Declarations
 ****************************************************************************/
// TODO value
enum error_defs {
    TY_BL_OK = 0,
    TY_BL_ERR = -100,
    TY_BL_INVALID_PARAM,
    TY_BL_MALLOC_FAILED,

    TY_BL_FLASH_INIT_ERR,
    TY_BL_FLASH_READ_ERR,
    TY_BL_FLASH_WRITE_ERR,
    TY_BL_FLASH_ERASE_ERR,

    TY_BL_CONF_MAGIC_ERR,
    TY_BL_CONF_CHECK_FAILED,
    TY_BL_CONF_NOT_FOUND,

    TY_BL_FT_INIT_ERR,
    TY_BL_FT_UNTERMINATORED,
    TY_BL_FT_CHECK_ERR,
    TY_BL_FT_NOT_FOUND,

    TY_BL_OTA_HEADER_MAGIC_ERR,
    TY_BL_OTA_HEADER_INVALID_LENGTH,
    TY_BL_OTA_HEADER_CHECK_ERR,
    TY_BL_OTA_DATA_ERR,
    TY_BL_OTA_TYPE_NOT_SUPPORT,
    TY_BL_OTA_TYPE_ERR,
    TY_BL_OTA_CHECK_MODE_ERR,
    TY_BL_OTA_FW_TOO_BIG,
    TY_BL_OTA_FW_CHECK_ERR,
    TY_BL_OTA_XZ_ERR,

    TY_BL_OTA_VERIFY_SIG_ERR,
};


/****************************************************************************
 * Public Data
 ****************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

void pin_test(void);


#ifdef __cplusplus
}
#endif

#endif /* !__TUYA_BOOT_H__ */
