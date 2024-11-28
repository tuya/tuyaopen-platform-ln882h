/****************************************************************************
 * @file tuya_boot_perip_handle.c
 * @brief handle peripherals while ota
 * @version 0.0.1
 * @date 2022-05-16
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/


/****************************************************************************

 Perip data stored in flash:
 ----------------------------------------------------------------------------
 |=|xxxx|xxxx|xxxx| ...  |xxxx|ooo|ooo|ooo| ... |ooo|***|
 ----------------------------------------------------------------------------
  ↑  ↑    ↑    ↑           ↑    ↑   ↑   ↑         ↑   ↑
  h  p0   p1   p3   ...    pN   g0  g1  g2  ...   gN  s

 h: header / p: pwm / g: gpio / s: check sum

 ****************************************************************************/



/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <stdint.h>
#include <stdlib.h>

#include "tuya_boot.h"
#include "port.h"
#include "tuya_boot_perip_handle.h"


/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/
#define TUYA_PERIPHERAL_CONFIG_MAGIC 		0x5459424C
#define PERIPHERAL_MAX_SIZE  4096   //4K

/****************************************************************************
 * Private Functions
 ****************************************************************************/
static struct perip_header *g_perp = NULL;

/****************************************************************************
 * Private Functions
 ****************************************************************************/

static int __bl_peripheral_cfg_get(uint32_t address,  uint8_t *buf, uint32_t len)
{
    port_flash_read(address, (uint8_t *)buf, len);
    return 0;
}

static int __bl_peripheral_cfg_check(struct perip_header *p)
{
    uint32_t real_sum = 0, logic_sum = 0;

    if(p->magic != TUYA_PERIPHERAL_CONFIG_MAGIC) {
        return TY_BL_INVALID_PARAM;
    }

    uint32_t data_size = sizeof(struct perip_header) + \
                         p->pwm_data_len + \
                         p->gpio_data_len + \
                         sizeof(uint32_t);

    uint8_t *buf = (uint8_t *)p;
    for(uint32_t i = 0; i < data_size - sizeof(uint32_t); i++)
        real_sum += buf[i];

    logic_sum = (buf[data_size - 1] << 24) + \
                (buf[data_size - 2] << 16) + \
                (buf[data_size - 3] << 8) + \
                buf[data_size - 4];

    if(real_sum != logic_sum) {
        bl_printf("__bl_peripheral_keep_check sum err: %x,  %x\r\n",logic_sum, real_sum);
        return TY_BL_CONF_CHECK_FAILED;
    }

    return TY_BL_OK;
}

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

int bl_peripheral_status_keep(uint32_t address)
{
    int ret = TY_BL_OK;

    g_perp = (struct perip_header *)malloc(PERIPHERAL_MAX_SIZE);

    __bl_peripheral_cfg_get(address, (uint8_t *)g_perp, PERIPHERAL_MAX_SIZE);

    ret = __bl_peripheral_cfg_check(g_perp);
    if(ret != TY_BL_OK) {
        free(g_perp);
        g_perp = NULL;
        return TY_BL_ERR;
    }

    platform_perip_setup(g_perp);

    return TY_BL_OK;
}

void bl_peripheral_remove(void)
{
    if (g_perp == NULL)
        return;

    platform_perip_remove(g_perp);

    free(g_perp);
    g_perp = NULL;
}



