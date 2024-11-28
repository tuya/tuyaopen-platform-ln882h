/****************************************************************************
 * @file flash_partition_table.h
 * @brief header file of flash_partition_table
 * @version <0.0.1>
 * @date 2022-05-06
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

#ifndef __FLASH_PARTITION_TABLE_H__
#define __FLASH_PARTITION_TABLE_H__


/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <stdint.h>

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/
#define FLASH_TABLE_MAGIC   0x5459    //TY
#define FLASH_TABLE_MIN_SIZE    0xC00

/****************************************************************************
 * Public Type Declarations
 ****************************************************************************/

struct item_desc {
    uint8_t magic[2];
    uint8_t type;
    uint8_t subtype;
    uint32_t ofs;
    uint32_t size;
    char name[16];
    uint32_t flag;
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


#ifdef __cplusplus
}
#endif

#endif /* !__FLASH_PARTITION_TABLE_H__ */
