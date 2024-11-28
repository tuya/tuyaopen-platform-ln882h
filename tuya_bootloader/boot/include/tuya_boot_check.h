/****************************************************************************
 * @file tuya_boot_check.h
 * @brief header file of tuya_boot_check
 * @version <0.0.1>
 * @date 2022-06-21
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

#ifndef __TUYA_BOOT_CHECK_H__
#define __TUYA_BOOT_CHECK_H__


/****************************************************************************
 * Included Files
 ****************************************************************************/
#include "bl_config.h"
#include <stdint.h>

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/


/****************************************************************************
 * Public Type Declarations
 ****************************************************************************/

/* check */
#pragma pack(push)
#pragma pack(1)
struct fw_sign_desc {
    uint8_t     flag;                       // 0x5A
    uint32_t    fw_len;
    char        separator[9];               // "SIG=TUYA,"
    uint8_t     sig[242];
};
#pragma pack(pop)

/****************************************************************************
 * Public Data
 ****************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/
uint32_t tuya_bl_sum_check(uint8_t *buf, uint32_t len);

#ifdef CONFIG_FW_VERIFY_MODE_SIGNATURE
int tuya_bl_signature_verify(uint32_t fw_addr, uint32_t sig_addr);
#endif // CONFIG_FW_VERIFY_MODE_SIGNATURE

#ifdef __cplusplus
}
#endif

#endif /* !__TUYA_BOOT_CHECK_H__ */
