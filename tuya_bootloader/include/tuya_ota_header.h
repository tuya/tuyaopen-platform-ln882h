/****************************************************************************
 * @file tuya_ota_header.h
 * @brief header file of ota file
 * @version <0.0.1>
 * @date 2022-03-30
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

#ifndef __TUYA_OTA_HEADER_H__
#define __TUYA_OTA_HEADER_H__


/****************************************************************************
 * Included Files
 ****************************************************************************/


/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/
#define TUYA_OTA_HEADER_MAGIC       0x5459424c  // TYBL

/* ota type */
#define OTA_TYPE_PINGPANG           0x01
#define OTA_TYPE_COMPRESS           0x02
#define OTA_TYPE_DIFF               0x04

/****************************************************************************
 * Public Type Declarations
 ****************************************************************************/

/****************************************************************************
  UG file description:

    |←--------------------------     OTA包   -------------------------------→|
    0                                                                       end
    ↓                                                                        ↓
    --------------------------------------------------------------------------
    |         |  512 bytes  |                                                |
    --------------------------------------------------------------------------
      header     check/sign                     xz/raw/diff

 check/sign:
    如果发现如下字符串，则当前固件需验签:
       5A XX XX XX XX 53 49 57 3D 54 55 59 41 2C
       <1> XX XX XX XX 为固件长度 ，可能未使用，兼容旧程序
       <2> 53 49 57 3D 54 55 59 41 2C 为签名标识符字符串 “SIG=TUYA,"
           SIG=TUYA,xxxxxxxxxxxx<signature data>
    如果未发现上述字符串，当前固件验证方式未校验和

 ****************************************************************************/

#pragma pack(push)
#pragma pack(1)

/* Header segment */
struct ota_header {
    uint32_t magic;                         // TUYA_OTA_HEADER_MAGIC
    uint8_t  header_length;                 // 文件头长度

    /* ota文件描述 <即UG> */
    uint8_t  ota_type;                      // ota文件类型
    char     ota_dest[14];                  // ota目标区域
    uint32_t ota_file_len;                  // ota文件总长度
    uint32_t ota_file_verify_length;        // ota文件校验数据长度，不包含标识符

    /* 以压缩升级为例，原始数据为解压后的文件数据 */
    char     raw_data_version[12];          // 原始数据版本
    uint32_t raw_data_len;                  // 原始数据长度
    uint32_t raw_data_verify_length;        // 原始数据校验长度

    uint32_t header_sum;                    // 结构体最后一个成员变量，此前所有成员累加和
};

/* check segment */
struct fw_sign_desc {
    uint8_t     flag;                       // 0x5A
    uint32_t    fw_len;
    char        separator[9];               // "SIG=TUYA,"
    uint8_t     sig[242];                   // 242 make the struct length 256 bytes
};

struct ota_check_desc {
    union {
        uint8_t buf1[256];
        struct fw_sign_desc ota_file_sign;
        uint32_t ota_file_check_sum;
    };
    union {
        uint8_t buf2[256];
        struct fw_sign_desc raw_data_sign;
        uint32_t raw_data_check_sum;
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


#ifdef __cplusplus
}
#endif

#endif /* !__TUYA_OTA_HEADER_H__ */
