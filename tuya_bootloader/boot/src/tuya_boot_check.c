/****************************************************************************
 * @file tuya_boot_check.c
 * @brief this module is used to tuya_boot_check
 * @version 0.0.1
 * @date 2022-06-21
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
#include "tuya_boot_flash_table.h"

#include "sha256.h"
#include "ecdsa.h"

#include "tuya_boot_check.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Private Type Declarations
 ****************************************************************************/

/****************************************************************************
 * Private Data Declarations
 ****************************************************************************/

#ifdef CONFIG_FW_VERIFY_MODE_SIGNATURE
static uint8_t public_key_new[64] = {
    0xda, 0x18, 0x57, 0x25, 0xed, 0xe5, 0x3e, 0x64,
    0x46, 0xf6, 0x99, 0xdc, 0x0a, 0xc9, 0x5b, 0x4c,
    0x6b, 0x2f, 0xbf, 0x88, 0x58, 0x87, 0x2d, 0xd4,
    0xfd, 0x8b, 0xd5, 0x20, 0xee, 0x2c, 0x2e, 0x72,
    0x8d, 0xf2, 0x35, 0xac, 0x06, 0xa5, 0xae, 0x5b,
    0x06, 0xaf, 0x03, 0x26, 0x23, 0x70, 0x97, 0x2e,
    0x6a, 0x73, 0xa9, 0xff, 0x3a, 0x20, 0xc3, 0xc0,
    0x9b, 0x33, 0xce, 0x60, 0xd9, 0xd0, 0x26, 0x62
};
#endif // CONFIG_FW_VERIFY_MODE_SIGNATURE

/****************************************************************************
 * Private Functions
 ****************************************************************************/

#ifdef CONFIG_FW_VERIFY_MODE_SIGNATURE

#define BUF_SIZE 4096
/*
 * Note: hash is an output parameter
 *
 * */
static int __tuya_bl_calc_fw_hash(uint32_t addr, uint32_t len, uint8_t *hash)
{
    uint32_t i;
    sha256_context ctx;
    uint8_t *buf = (uint8_t *) malloc(BUF_SIZE);
    uint32_t end = addr + len;

    if (buf == NULL)
        return TY_BL_MALLOC_FAILED;

    sha256_init(&ctx);

    for (i = addr; i < end; i += BUF_SIZE) {
        memset(buf, 0, BUF_SIZE);
        uint32_t read_len = (i + BUF_SIZE < end? BUF_SIZE: end - i);
        port_flash_read(i, buf, read_len);
        sha256_hash(&ctx, buf, read_len);
    }

    sha256_done(&ctx, hash);

    free(buf);
    buf = NULL;

    return TY_BL_OK;
}

/*
 * Note: raw signature store in string, conver to hex
 *
 * */
static inline uint8_t char2hex(char x)
{
    uint8_t tmp = 0;

    if (x >= '0' && x <= '9')
        tmp = x - '0';
    else if (x >= 'a' && x <= 'f')
        tmp = x - 'a' + 10;
    else if (x >= 'A' && x <= 'F')
        tmp = x - 'A' + 10;

    return tmp;
}

static int __tuya_bl_sig_convert(uint8_t *in, uint8_t *out)
{
    uint32_t i, index = 0;
    uint8_t buf[128];

    if (in == NULL || out == NULL)
        return TY_BL_INVALID_PARAM;

    uint32_t len = strlen((char *)in);
    for (i = 0; i < len; i += 2) {
        buf[i/2] = (char2hex(in[i]) << 4) | char2hex(in[i + 1]);
    }

    /* 没搞明白下面这些索引、偏移等参数含义 */
    /* r len */
    if (buf[3] == 0x21) {
        memcpy(out, &buf[5], 32);
        index = 38;
    } else {
        memcpy(out, &buf[4], 32);
        index = 37;
    }

    /* s len */
    if (buf[index] == 0x21) {
        memcpy(&out[32], &buf[index + 2], 32);
    } else {
        memcpy(&out[32], &buf[index + 1], 32);
    }

    return TY_BL_OK;
}

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

/*
 * Note:
 *  固件所在的***分区尾部***固定长度256字节保存校验标志、
 *  固件长度、签名值数据.
 *  ------------------------------------------------------------
 *  |          fw bin                   | maybe not used     | |
 *  ------------------------------------------------------------
 *                                                            ↑
 *  | 0x5A | fw length <4bytes> | SIG=TUYA,xxxxx | not used    |
 *
 *  1、根据地址与长度计算固件hash
 *  2、获取签名
 *  3、验签
 *
 *  param:
 *      fw_addr : 固件起始地址
 *      fw_len  : 固件长度
 *      sig_addr: 签名存储地址
 * */
int tuya_bl_signature_verify(uint32_t fw_addr, uint32_t sig_addr)
{
    uint8_t hash[32];
    uint8_t raw_sig[64];
    struct fw_sign_desc desc;
    int ret = 0;

    /* 获取保存的签名值 */
    port_flash_read(sig_addr, (uint8_t *)&desc, sizeof(struct fw_sign_desc));
    __tuya_bl_sig_convert(desc.sig, raw_sig);

    /* 计算固件hash值 */
    ret = __tuya_bl_calc_fw_hash(fw_addr, desc.fw_len, hash);
    if (ret != TY_BL_OK)
        return ret;

    /* 验签 */
    ret = ecdsa_verify(ECC_CURVE_SECP256K1, \
                        (uint64_t *)public_key_new, \
                        (uint64_t *)hash, \
                        (uint64_t *)raw_sig);
    if (ret)
        return TY_BL_OTA_VERIFY_SIG_ERR;
    else
        return TY_BL_OK;
}
#endif // CONFIG_FW_VERIFY_MODE_SIGNATURE

uint32_t tuya_bl_sum_check(uint8_t *buf, uint32_t len)
{
    uint32_t sum = 0;

    if (buf == NULL || len == 0)
        return 0;

    for (uint32_t i = 0; i < len; i++)
        sum += buf[i];

    return sum;
}

