/****************************************************************************
 * @file port_flash.c
 * @brief this module is used to port_flash
 * @version 0.0.1
 * @date 2022-05-16
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include "tuya_boot.h"
#include "port.h"
#include "hal/hal_flash.h"
#include "hal/hal_qspi.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Private Type Declarations
 ****************************************************************************/

/****************************************************************************
 * Private Data Declarations
 ****************************************************************************/

/****************************************************************************
 * Private Functions
 ****************************************************************************/

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

/**
 * @brief flash init
 *
 * @param[in] buf: buffer
 * @param[in] len: buffer size
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
__bl_weak_func int port_flash_init(void)
{
    hal_flash_init();
    flash_cache_disable();
    return 0;
}

/**
 * @brief flash init
 *
 * @param[in] buf: buffer
 * @param[in] len: buffer size
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
__bl_weak_func int port_flash_deinit(void)
{
    return TY_BL_ERR;
}

/**
 * @brief flash read
 *
 * @param[in] buf: buffer
 * @param[in] len: buffer size
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
__bl_weak_func int port_flash_read(uint32_t address, uint8_t *buf, uint32_t len)
{
    hal_flash_read(address, len, buf);

    uint32_t cnt = 10000;
    while(cnt--);

    return 0;
}

/**
 * @brief flash write
 *
 * @param[in] buf: buffer
 * @param[in] len: buffer size
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
__bl_weak_func int port_flash_write(uint32_t address, uint8_t *buf, uint32_t len)
{
    hal_flash_program(address, len, buf);
    return 0;
}

/**
 * @brief flash erase
 *
 * @param[in] buf: buffer
 * @param[in] len: buffer size
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
__bl_weak_func int port_flash_erase(uint32_t address, uint32_t len)
{
    hal_flash_erase(address, len);
    return 0;
}


