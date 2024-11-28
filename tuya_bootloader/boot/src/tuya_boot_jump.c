/****************************************************************************
 * @file tuya_boot_jump.c
 * @brief this module is used to tuya_boot_jump
 * @version 0.0.1
 * @date 2022-05-18
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <stdint.h>

#include "tuya_boot.h"
#include "tuya_boot_jump.h"
#include "port.h"

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
 * @brief execute program according to info, address
 *
 * @param[in] info: partiotion information
 *
 */
void bl_exec(uint32_t address)
{
    platform_do_jump(address);
}

/**
 * @brief execute app
 *
 * @param[in] info: application partiotion information
 * @param[in] address: the address where is program stored
 *
 */
void bl_exec_app(void)
{
    struct ft_item_info app;

    bl_lookup_flash_table("app", &app);

    bl_exec(app.address + app.offset);
}


