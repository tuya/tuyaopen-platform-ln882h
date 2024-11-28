/****************************************************************************
 * @file tuya_boot_flash_table.c
 * @brief this module is used to tuya_boot_flash_table
 * @version 0.0.1
 * @date 2022-05-17
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <stddef.h>

#include "tuya_boot.h"
#include "tuya_boot_conf.h"
#include "tuya_boot_flash_table.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Private Type Declarations
 ****************************************************************************/
#define FT_MAGIC 0x5459
#define FT_END 0xebeb
#define FLASH_TABLE_MIN_SIZE    0xC00
#define MAX_FLASH_TABLE_LEN     2048

/****************************************************************************
 * Private Data Declarations
 ****************************************************************************/
static volatile uint8_t g_item_num = 0;
static struct flash_table_desc *g_flash_table = NULL;

/****************************************************************************
 * Private Functions
 ****************************************************************************/
static void item_dump(struct flash_table_desc *info)
{
    bl_printf("-------------------------------\r\n");
    bl_printf("name: %s:\r\n", info->item.name);
    bl_printf("\ttype: %x, subtype: %x, flag: %x\r\n",
                info->item.type,
                info->item.subtype,
                info->item.flag);
    bl_printf("\taddress: %x, size: %x, offset: %x\r\n",
                info->item.address,
                info->item.size,
                info->item.offset);
    bl_printf("-------------------------------\r\n");
}

static int __bl_flashTable_check(struct flash_table_desc *info)
{
    uint32_t i, sum = 0;
    uint16_t magic;

    do {
        magic = (info->buf[1] << 8 | info->buf[0]);
        if (magic == FT_END) {
            break;
        } else if (magic == FT_MAGIC) {
            g_item_num++;
            for (i = 0; i < sizeof(struct ft_item_info); i++) {
                sum += info->buf[i];
            }
        } else {
            // magic == 0xffff
            bl_printf("flash table check, undefined magic, %x\r\n", magic);
            return TY_BL_FT_CHECK_ERR;
        }

        //item_dump(info);
        info++;
    } while (1);

    if (sum != info->check.check_sum) {
        bl_printf("check sum, %x %x\r\n", sum, info->check.check_sum);
        return TY_BL_FT_CHECK_ERR;
    }

    return TY_BL_OK;
}

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/
/**
 * @brief flash table initialize
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
int bl_flash_table_init(void)
{
    int ret = 0;
    uint8_t val[16];
    uint32_t address = 0;

    ret = bl_get_conf_val("flash_table", val, sizeof(val));
    if (ret != TY_BL_OK) {
        bl_printf("get flash table error, %d\r\n", ret);
        return TY_BL_FT_INIT_ERR;
    }

    g_flash_table = (struct flash_table_desc *) malloc (MAX_FLASH_TABLE_LEN);
    if (g_flash_table == NULL) {
        bl_printf("malloc for flash table error, %d\r\n", ret);
        return TY_BL_FT_INIT_ERR;
    }

    address = strtol((const char *)val, NULL, 16);
    port_flash_read(address, (uint8_t *)g_flash_table, MAX_FLASH_TABLE_LEN);

    ret = __bl_flashTable_check(g_flash_table);
    if (ret != TY_BL_OK) {
        bl_printf("flash table check error, %d\r\n", ret);
        return TY_BL_FT_INIT_ERR;
    }

    return TY_BL_OK;
}

/**
 * @brief parse flash table
 *
 * @param[in] item: table name
 * @param[out] info: table info
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
int bl_lookup_flash_table(char *item, struct ft_item_info *info)
{
    int i;

    if (item == NULL || info == NULL)
        return TY_BL_INVALID_PARAM;

    for (i = 0; i < g_item_num; i++) {
        if (!strcmp(item, (const char *)g_flash_table[i].item.name)) {
            //item_dump(&g_flash_table[i]);
            memcpy(info, &g_flash_table[i].item, sizeof(struct ft_item_info));
            break;
        }
    }

    if (i == g_item_num)
        return TY_BL_FT_NOT_FOUND;

    return TY_BL_OK;
}


