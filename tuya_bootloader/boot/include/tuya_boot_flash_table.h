/****************************************************************************
 * @file tuya_boot_flash_table.h
 * @brief header file of tuya_boot_flash_table
 * @version <0.0.1>
 * @date 2022-05-17
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

#ifndef __TUYA_BOOT_FLASH_TABLE_H__
#define __TUYA_BOOT_FLASH_TABLE_H__


/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <stdint.h>

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Public Type Declarations
 ****************************************************************************/

#pragma pack(push)
#pragma pack(1)
struct ft_item_info {
    uint8_t magic[2];
    uint8_t type;
    uint8_t subtype;
    uint32_t address;
    uint32_t size;
    uint16_t offset;
    char name[14];
    uint32_t flag;
};

struct ft_check {
    uint8_t magic[2];
    uint8_t __padding1[14];
    uint16_t check_sum;
    uint8_t __padding2[14];
};

struct flash_table_desc {
    union {
        uint8_t buf[32];
        struct ft_item_info item;
        struct ft_check check;
    };
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

int bl_flash_table_init(void);
int bl_lookup_flash_table(char *item, struct ft_item_info *info);

#ifdef __cplusplus
}
#endif

#endif /* !__TUYA_BOOT_FLASH_TABLE_H__ */
