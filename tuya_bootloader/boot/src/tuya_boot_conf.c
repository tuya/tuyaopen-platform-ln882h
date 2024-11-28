/****************************************************************************
 * @file tuya_boot_conf.c
 * @brief this module is used to tuya_boot_conf
 * @version 0.0.1
 * @date 2022-05-16
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <stddef.h>

#include "tuya_boot.h"
#include "tuya_boot_conf.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

#define MAX_CONFIG_SIZE 2048
#define CONF_MAGIC 0x5459
#define ENDS_MAGIC 0xebeb
/****************************************************************************
 * Private Type Declarations
 ****************************************************************************/
// 4k / max item num is 127 <exclude header>
struct tuya_bl_conf {
    uint16_t magic;
    uint8_t key[14];
    union {
        uint8_t v[16];
        uint32_t data[4];
    };
};

static uint32_t g_item_cnt = 0;

/****************************************************************************
 * Private Data Declarations
 ****************************************************************************/
static struct tuya_bl_conf *g_conf = NULL;

/****************************************************************************
 * Private Functions
 ****************************************************************************/
static int __bl_conf_data_check(struct tuya_bl_conf *data)
{
    int ret = TY_BL_CONF_CHECK_FAILED;
    uint32_t sum = 0;

    do {
        if (data->magic != CONF_MAGIC) {
            break;
        }

        uint8_t *tmp = (uint8_t *) data;
        for (uint32_t i = 0; i < sizeof(struct tuya_bl_conf); i++) {
            sum += tmp[i];
        }
        data += 1;
        g_item_cnt++;
    } while(1);

    if (data->magic != ENDS_MAGIC) {
        bl_printf("config no end %x\r\n", data->magic);
        return ret;
    }

    if (sum != data->data[0]) {
        bl_printf("config check error %x\r\n", data->magic);
        return TY_BL_CONF_CHECK_FAILED;
    } else
        return TY_BL_OK;
}

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

int bl_conf_init(void)
{
    int ret = -1;

    g_conf = (struct tuya_bl_conf *) malloc(MAX_CONFIG_SIZE);
    if (g_conf == NULL) {
        bl_printf("malloc for config failed\r\n");
        return ret;
    }

    ret = port_flash_read(CONFIG_TUYA_CONFIG_ADDRESS, (uint8_t *)g_conf, MAX_CONFIG_SIZE);
    if (ret < 0) {
        bl_printf("read conf header failed, %d\r\n", ret);
        return ret;
    }

    ret = __bl_conf_data_check(g_conf);
    if (ret < 0) {
        bl_printf("conf header check error, %d\r\n", ret);
        return ret;
    }

    return 0;
}

/**
 * @brief get value by key
 *
 * @param[in] address: current program exec address
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
int bl_get_conf_val(const char *key, uint8_t *val, uint32_t len)
{
    int ret = -1;
    uint32_t i;

    if (key == NULL || val == NULL)
        return TY_BL_INVALID_PARAM;

    for (i = 0; i < g_item_cnt; i++) {
        ret = strcmp(key, (const char *)g_conf[i].key);
        if (!ret) {
            break;
        }
    }

    if (i == g_item_cnt) {
        bl_printf("config item not found %s value\r\n", key);
        return TY_BL_CONF_NOT_FOUND;
    }

    uint32_t l = (len > 16)? 16: len;
    memcpy(val, g_conf[i].v, l);

    return 0;
}


