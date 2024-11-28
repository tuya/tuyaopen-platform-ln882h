/****************************************************************************
 * @file tuya_boot_ota.c
 * @brief this module is used to tuya_boot_ota
 * @version 0.0.1
 * @date 2022-05-18
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <string.h>
#include <stdint.h>
#include <stdlib.h>

#include "xz.h"
#include "xz_lib.h"
#include "xz_config.h"
#include "tuya_boot.h"
#include "tuya_boot_check.h"
#include "tuya_boot_flash_table.h"
#include "tuya_boot_ota.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

#define OTA_BUF_SIZE    4096

#define TUYA_OTA_HEADER_MAGIC       0x5459424c  // TYBL

/* ota type */
#define OTA_TYPE_PINGPANG           0x01
#define OTA_TYPE_COMPRESS           0x02
#define OTA_TYPE_DIFF               0x04

#define OTA_SIGNATURE_STR           "SIG=TUYA,"
#define OTA_SIGNATURE_STR_LEN       9

/****************************************************************************
 * Private Type Declarations
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
 * Private Data Declarations
 ****************************************************************************/
static struct ota_header *header = NULL;
static struct ft_item_info *dest = NULL;

/****************************************************************************
 * Private Functions
 ****************************************************************************/

static int __bl_ota_header_check(const uint32_t header_address)
{
    uint32_t sum = 0, header_sum = 0;
    uint32_t header_length = sizeof(struct ota_header);
    uint32_t read_len = sizeof(struct ota_header) + sizeof(struct ota_check_desc);

    header = (struct ota_header *) malloc(read_len);
    if (header == NULL) {
        return -1;
    }

    port_flash_read(header_address, (uint8_t *)header, read_len);

    if (header->magic != TUYA_OTA_HEADER_MAGIC) {
        free(header);
        header = NULL;
        return TY_BL_OTA_HEADER_MAGIC_ERR;
    }

    /*
     *  文件头校验，先从flash中读取 文件头及校验数据区，如果读取的文件头长度与当前
     *  定义的文件头长度不相同，则意味着文件头有变化，则根据flash中描述的实际文件头
     *  长度从新读取数据. 此后读取升级数据也根据flash中定义的文件头长度做相应偏移
     *
     */

    header_length = header->header_length;
    if (header_length != sizeof(struct ota_header)) {
        free(header);
        header = NULL;

        /* 根据flash中描述的文件头长度从新读取数据*/
        read_len = header_length + sizeof(struct ota_check_desc);
        header = (struct ota_header *) malloc(read_len);
        if (header == NULL) {
            return TY_BL_MALLOC_FAILED;
        }
        bl_printf("re-read ota header: %x\r\n", read_len);
        port_flash_read(header_address, (uint8_t *)header, read_len);
    }

    /*
     *  OTA_TYPE_PINGPANG           0x01
     *  OTA_TYPE_COMPRESS           0x02
     *  OTA_TYPE_DIFF               0x04
     * */
    if (header->ota_type != OTA_TYPE_COMPRESS) {
        free(header);
        header = NULL;
        return TY_BL_OTA_TYPE_NOT_SUPPORT;
    }

    /* 避免数据溢出 */
    header->ota_dest[13] = '\0';

    /* 根据文件头实际长度获取校验和，不要使用指针强制转换，
     * 在ARMv5中不支持数据非对齐访问
     */
    //header_sum = *((uint32_t *)(((uint8_t *)header) + header_length - 4));
    uint8_t *tmp_ptr = (uint8_t *)header + header_length - 4;
    header_sum = tmp_ptr[3] << 24 | tmp_ptr[2] << 16 | tmp_ptr[1] << 8 | tmp_ptr[0] << 0;
    bl_printf("header check sum: %x\r\n", header_sum);

    if (header->ota_file_len == 0) {
        bl_printf("Invalid ota length, %d\r\n", \
                header->ota_file_len);
        return TY_BL_OTA_HEADER_INVALID_LENGTH;
    }

    uint8_t *buf = (uint8_t *)header;
    sum = tuya_bl_sum_check(buf, header_length - sizeof(uint32_t));

    if (sum != header_sum) {
        bl_printf("Invalid ota header, sum: %x, %x\r\n", \
                sum, header_sum);
        return TY_BL_OTA_HEADER_CHECK_ERR;
    }

    bl_printf("header length: %d\r\n", header_length);
    bl_printf("ota_type: %x\r\n", header->ota_type);
    bl_printf("ota_dest: %s\r\n", header->ota_dest);
    bl_printf("ota file len: %x\r\n", header->ota_file_len);
    bl_printf("raw file len: %x\r\n", header->raw_data_len);
    bl_printf("raw file version: %s\r\n", header->raw_data_version);

    return TY_BL_OK;
}

#ifdef CONFIG_FW_VERIFY_MODE_SIGNATURE
static int __bl_ota_data_check(const uint32_t ota_partition_address)
{
    uint32_t sig_address = ota_partition_address + header->header_length;
    uint32_t addr = sig_address + sizeof(struct ota_check_desc);

    return tuya_bl_signature_verify(addr, sig_address);
}
#else // !CONFIG_FW_VERIFY_MODE_SIGNATURE
static int __bl_ota_data_check(const uint32_t ota_partition_address)
{
    uint32_t i, sum = 0;
    uint32_t begin, end, ofs;
    struct ota_check_desc *check = (struct ota_check_desc *)(header + 1);
    uint32_t read_len = 0;
    uint8_t *check_buf = NULL;

    check_buf = (uint8_t *)malloc(OTA_BUF_SIZE);
    if (check_buf == NULL)
        return -1;

    ofs = header->header_length + sizeof(struct ota_check_desc);

    begin = ota_partition_address + ofs;
    end = ota_partition_address + header->ota_file_len;

    for (i = begin; i < end; i += OTA_BUF_SIZE) {
        memset(check_buf, 0, OTA_BUF_SIZE);
        read_len = (i + OTA_BUF_SIZE < end)? OTA_BUF_SIZE: end - i;
        port_flash_read(i, check_buf, read_len);
        sum += tuya_bl_sum_check(check_buf, read_len);
    }

    free(check_buf);
    check_buf = NULL;

    if (sum != check->ota_file_check_sum) {
        bl_printf("ota file sum error, sum %x %x\r\n", \
                sum, check->ota_file_check_sum);
        return TY_BL_OTA_DATA_ERR;
    }

    return TY_BL_OK;
}
#endif // CONFIG_FW_VERIFY_MODE_SIGNATURE

/*
 * Note:
 *  对比本地flash与ota包check段中是否存在签名标识
 *      1、如果使能了CONFIG_FW_VERIFY_MODE_SIGNATURE，则二者必须都存在签名标识
 *      2、二者校验模式必须相同
 *      3、本地如果存在签名数据，则存储在分区末尾256字节空间中
 * */
static int __bl_check_mode_is_fit(void)
{
    uint32_t local_sig_address = dest->address + dest->size - 256;
    volatile uint8_t ota_sign = 0, local_sign = 0;
    struct ota_check_desc *check = (struct ota_check_desc *)(header + 1);
    uint8_t *check_buf = NULL;

    check_buf = (uint8_t *)malloc(OTA_BUF_SIZE);
    if (check_buf == NULL)
        return -1;

    if (strncmp((const char *)&check->buf2[5], OTA_SIGNATURE_STR, OTA_SIGNATURE_STR_LEN) == 0) {
        ota_sign = 1;
    }

    memset(check_buf, 0, OTA_BUF_SIZE);
    port_flash_read(local_sig_address, check_buf, 256);
    if (strncmp((const char *)&check_buf[5], OTA_SIGNATURE_STR, OTA_SIGNATURE_STR_LEN) == 0) {
        local_sign = 1;
    }

    free(check_buf);
    check_buf = NULL;

#ifdef CONFIG_FW_VERIFY_MODE_SIGNATURE
    /* 如果配置了 CONFIG_FW_VERIFY_MODE_SIGNATURE 选项，
     * 则本地与OTA文件均应该为签名文件 */
    if (local_sign != 1 || ota_sign != 1)
        return TY_BL_OTA_CHECK_MODE_ERR;
#endif // CONFIG_FW_VERIFY_MODE_SIGNATURE

    /* 必须为相同类型升级：
     *  本地为安全固件则升级包必须为安全固件，
     *  本地为非安全固件则升级包必须为非安全固件 */
    if (ota_sign == local_sign)
        return TY_BL_OK;

    return TY_BL_OTA_CHECK_MODE_ERR;
}

/*
 * 1、ota文件<UG>校验
 * 2、本地参数与ota携带参数校验
 * */
static int __bl_before_ota_check(const uint32_t ota_address)
{
    int ret = TY_BL_OK;

    /* OTA文件头校验 */
    ret = __bl_ota_header_check(ota_address);
    if (ret != TY_BL_OK)
        return ret;

    dest = (struct ft_item_info *)malloc(sizeof(struct ft_item_info));
    if (dest == NULL)
        return TY_BL_MALLOC_FAILED;

    /* 获取升级区信息 */
    ret = bl_lookup_flash_table(header->ota_dest, dest);
    if (ret != TY_BL_OK) {
        bl_printf("not found upgrade dest, %s\r\n", header->ota_dest);
        return ret;
    }

    /* 判断分区空间是否符合固件大小 */
    uint32_t fw_end = dest->address + dest->offset + header->raw_data_len;
    uint32_t partition_end  = dest->address + dest->size;

    if (partition_end < fw_end)
        return TY_BL_OTA_FW_TOO_BIG;

#ifdef CONFIG_FW_VERIFY_MODE_SIGNATURE
    /* 如果是签名固件，则需在分区末尾保留至少256字节，用于保存签名数据 */
    if (partition_end - fw_end < 256) {
        bl_printf("no enough room to store fw signature, left %d\r\n",
              partition_end - fw_end);
        return TY_BL_OTA_FW_TOO_BIG;
    }
#endif // CONFIG_FW_VERIFY_MODE_SIGNATURE

    /* 判断本地校验模式与升级包校验模式是否相容 */
    ret = __bl_check_mode_is_fit();
    if (ret != TY_BL_OK)
        return ret;

    ret = __bl_ota_data_check(ota_address);
    if (ret != TY_BL_OK)
        return ret;

    return ret;
}

#ifdef CONFIG_FW_VERIFY_MODE_SIGNATURE
static int __bl_after_ota_check(void)
{
    int ret = TY_BL_OK;
    struct ota_check_desc *check = (struct ota_check_desc *)(header + 1);
    uint32_t partition_end  = dest->address + dest->size;

    /* 将签名相关数据写入flash */
    uint8_t *buf = (uint8_t *)malloc(256);
    memcpy(buf, check->buf2, sizeof(check->buf2));
    uint32_t sig_address = partition_end - 256;
    port_flash_write(sig_address, buf, sizeof(buf));
    free(buf);
    buf = NULL;

    ret = tuya_bl_signature_verify(dest->address + dest->offset,
                                   sig_address);
    if (ret != TY_BL_OK)
        return ret;

    return ret;
}
#else // !CONFIG_FW_VERIFY_MODE_SIGNATURE
static int __bl_after_ota_check(void)
{
    uint32_t i, sum = 0;
    uint32_t begin, end;
    struct ota_check_desc *check = (struct ota_check_desc *)(header + 1);
    uint8_t *check_buf = NULL;

    check_buf = (uint8_t *)malloc(OTA_BUF_SIZE);
    if (check_buf == NULL)
        return -1;

    begin = dest->address + dest->offset;
    end = begin + header->raw_data_len;

    for (i = begin; i < end; i += OTA_BUF_SIZE) {
        memset(check_buf, 0, OTA_BUF_SIZE);
        uint32_t read_len = (i + OTA_BUF_SIZE < end)? OTA_BUF_SIZE: end - i;
        port_flash_read(i, check_buf, read_len);
        sum += tuya_bl_sum_check(check_buf, read_len);
    }

    free(check_buf);
    check_buf = NULL;

    if (sum != check->raw_data_check_sum) {
        bl_printf("raw data sum error, length %d, sum %d %d\r\n", \
                header->raw_data_len, sum, check->raw_data_check_sum);
        return TY_BL_OTA_FW_CHECK_ERR;
    }

    return TY_BL_OK;
}
#endif // CONFIG_FW_VERIFY_MODE_SIGNATURE

#define IN_BUF_SIZE (128)
#define OUT_BUF_SIZE (1024*4)

static struct xz_buf *b;
static struct xz_dec *s = NULL;

static int __bl_do_xz_ota(const uint32_t ota_data_address,
        const uint32_t ota_file_len,
        const uint32_t ota_dest_address)
{
    int ret = 0;

    xz_crc32_init();

    /* xz解压缩过程控制块 */
    s = xz_dec_init(XZ_DYNALLOC, 4 * 1024);
    if (s == NULL) {
        goto _error;
    }

    /* xz解压缩输入/输出buffer */
    b = (struct xz_buf *) malloc(sizeof(struct xz_buf));

    b->in = (uint8_t *)malloc(IN_BUF_SIZE);
    b->in_pos = 0;
    b->in_size = 0;
    b->out = (uint8_t *)malloc(OUT_BUF_SIZE);
    b->out_pos = 0;
    b->out_size = OUT_BUF_SIZE;

    bl_printf("FreeHeapSize: %d\r\n", xPortGetFreeHeapSize());

    uint32_t nbytes = 0;
    uint32_t readed_len = 0;
    uint32_t write_len = 0;
    while (1) {
        /* 读取压缩文件数据，
         * xz输入缓冲区标志置位，
         * 记录当前读取偏移 */
        if (b->in_pos == b->in_size) {
            if (readed_len + IN_BUF_SIZE < ota_file_len)
                nbytes = IN_BUF_SIZE;
            else
                nbytes = ota_file_len - readed_len;

            port_flash_read(ota_data_address + readed_len, (uint8_t *)b->in, nbytes);

            b->in_pos = 0;
            b->in_size = nbytes;
            readed_len += nbytes;
        }

        /* xz解压数据，
         * 1、输出buffer满，写入flash后，置位输出buffer偏移为0，继续解压数据
         * 2、输出buffer不满，且未报错，则输入数据已消耗完，读入压缩数据继续解压
         * 3、解压完成，将输出buffer中数据写入flash并退出循环
         * 4、解压错误，退出循环
         * */
        ret = xz_dec_run(s, b);
        if (b->out_pos == OUT_BUF_SIZE) {
            port_flash_write(ota_dest_address + write_len, b->out, b->out_pos);

            /* 解压过程较为耗时，增加过程log */
//            bl_printf("read ota ofs: 0x%x, write address: 0x%x, w len: %x\r\n",
//                    readed_len, ota_dest_address + write_len, b->out_pos);

            b->out_pos = 0;
            write_len += b->out_size;

            if (write_len % (50 * 1024) == 0) {
                uint8_t i = (readed_len * 100) / ota_file_len;
                uint8_t d = (readed_len * 100) % ota_file_len;
                bl_printf("process: %d.%d%%\r\n", i, d);
            }
        }

        if (ret == XZ_OK)
            continue;

        if(ret == XZ_STREAM_END) {
            port_flash_write(ota_dest_address + write_len, b->out, b->out_pos);
            bl_printf("xz finish %d\r\n", ret);
            ret = TY_BL_OK;
        } else {
            bl_printf("xz error %d\r\n", ret);
            ret = TY_BL_OTA_XZ_ERR;
        }
        break;
    }
    xz_dec_end(s);

    bl_printf("FreeHeapSize: %d\r\n", xPortGetFreeHeapSize());

_error:
    free((uint8_t *)b->in);
    free(b->out);
    free(b);
    return ret;
}


/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

/**
 * @brief do upgrade
 *
 * @return 0 on success. -1 on error
 */

int bl_do_upgrade(const struct ft_item_info * const ota)
{
    int ret = TY_BL_OK;
    uint32_t ota_data_ofs;
    uint32_t ota_data_len;
    uint32_t ota_dest_address;

    ret = __bl_before_ota_check(ota->address);
    if (ret != TY_BL_OK) {
        // 此时还未擦除flash，返回错误并跳转到应用区执行
        goto _ota_exit;
    }

    ota_dest_address = dest->address + dest->offset;
    bl_printf("Erase, start address %x, length %dk.\r\n", \
            dest->address, dest->size / 1024);

    /* 擦除升级区域 */
    port_flash_erase(dest->address, dest->size);

    ota_data_ofs = header->header_length + sizeof(struct ota_check_desc);
    ota_data_len = header->ota_file_len - ota_data_ofs;
    if (header->ota_type == OTA_TYPE_COMPRESS) {
        /* XZ解压升级 */
        ret = __bl_do_xz_ota(ota->address + ota_data_ofs, ota_data_len, ota_dest_address);
    } else if (header->ota_type == OTA_TYPE_DIFF) {
        /* 差分升级 */
        ret = TY_BL_OTA_TYPE_NOT_SUPPORT;
    } else if (header->ota_type == OTA_TYPE_PINGPANG) {
        ret = TY_BL_OTA_TYPE_NOT_SUPPORT;
    }

    if (ret != TY_BL_OK) {
        bl_printf("upgrade failed, reboot and retry, %d\r\n", ret);
        // 应用数据已经被擦除，ota包验证没有问题，复位重新解压数据
        platform_system_reboot();
    }

    ret = __bl_after_ota_check();
    if (ret != TY_BL_OK) {
        bl_printf("check failed, reboot and retry\r\n", ret);
        // 复位重新解压数据
        platform_system_reboot();
    }

    // OTA成功，擦除OTA区前4k空间，破坏数据
    port_flash_erase(ota->address, 4096);

_ota_exit:
    if (header != NULL)
        free(header);
    header = NULL;

    if (dest != NULL)
        free(dest);
    dest = NULL;

    return ret;
}

