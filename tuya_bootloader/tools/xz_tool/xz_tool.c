///////////////////////////////////////////////////////////////////////////////
//
/// \file       03_compress_custom.c
/// \brief      Compress in multi-call mode using x86 BCJ and LZMA2
///
/// Usage:      ./03_compress_custom < INFILE > OUTFILE
///
/// Example:    ./03_compress_custom < foo > foo.xz
//
//  Author:     Lasse Collin
//
//  This file has been put into the public domain.
//  You can do whatever you want with this file.
//
///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <getopt.h>
#include <lzma.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include "tuya_ota_header.h"

uint32_t raw_data_len = 0;
uint32_t raw_data_sum = 0;
struct ota_header header;
struct ota_check_desc check;

lzma_options_lzma opt_lzma = {
    .dict_size = 1U << 12,
    .depth = 0,
    .mode = LZMA_MODE_NORMAL,
    .nice_len = 273,
    .lc = LZMA_LC_DEFAULT,
    .lp = LZMA_LP_DEFAULT,
    .pb = LZMA_PB_DEFAULT,
    .mf = LZMA_MF_BT4,
    .preset_dict = NULL,
};

static int init_encoder(lzma_stream *strm)
{

    // Now we could customize the LZMA2 options if we wanted. For example,
    // we could set the the dictionary size (opt_lzma2.dict_size) to
    // something else than the default (8 MiB) of the default preset.
    // See lzma/lzma12.h for details of all LZMA2 options.
    //
    // The x86 BCJ filter will try to modify the x86 instruction stream so
    // that LZMA2 can compress it better. The x86 BCJ filter doesn't need
    // any options so it will be set to NULL below.
    //
    // Construct the filter chain. The uncompressed data goes first to
    // the first filter in the array, in this case the x86 BCJ filter.
    // The array is always terminated by setting .id = LZMA_VLI_UNKNOWN.
    //
    // See lzma/filter.h for more information about the lzma_filter
    // structure.

    lzma_filter filters[] = {
        { .id = LZMA_FILTER_LZMA2, .options = &opt_lzma },
        { .id = LZMA_VLI_UNKNOWN, .options = NULL },
    };

    // Initialize the encoder using the custom filter chain.
    lzma_ret ret = lzma_stream_encoder(strm, filters, LZMA_CHECK_CRC32);

    if (ret == LZMA_OK)
        return 1;

    const char *msg;
    switch (ret) {
        case LZMA_MEM_ERROR:
            msg = "Memory allocation failed";
            break;

        case LZMA_OPTIONS_ERROR:
            // We are no longer using a plain preset so this error
            // message has been edited accordingly compared to
            // 01_compress_easy.c.
            msg = "Specified filter chain is not supported";
            break;

        case LZMA_UNSUPPORTED_CHECK:
            msg = "Specified integrity check is not supported";
            break;

        default:
            msg = "Unknown error, possibly a bug";
            break;
    }

    fprintf(stderr, "Error initializing the encoder: %s (error code %u)\n",
            msg, ret);
    return 0;
}


// This function is identical to the one in 01_compress_easy.c.
static bool compress(lzma_stream *strm, int fd_in, int fd_out)
{
    lzma_action action = LZMA_RUN;

    uint8_t inbuf[BUFSIZ];
    uint8_t outbuf[BUFSIZ];
    FILE *fp = NULL;

    lseek(fd_in, 0, SEEK_SET);

    fp = fdopen(fd_in, "r");
    if (fp == NULL) {
        printf("Open file stream failed, %s\n", strerror(errno));
        return -1;
    }

    strm->next_in = NULL;
    strm->avail_in = 0;
    strm->next_out = outbuf;
    strm->avail_out = sizeof(outbuf);

    while (true) {
        if (strm->avail_in == 0 && !feof(fp)) {
            strm->next_in = inbuf;
            strm->avail_in = fread(inbuf, 1, sizeof(inbuf), fp);

            if (feof(fp))
                action = LZMA_FINISH;
        }

        lzma_ret ret = lzma_code(strm, action);

        if (strm->avail_out == 0 || ret == LZMA_STREAM_END) {
            size_t write_size = sizeof(outbuf) - strm->avail_out;

            if (write(fd_out, outbuf, write_size) != write_size) {
                fprintf(stderr, "Write error: %s\n", strerror(errno));
                return false;
            }

            strm->next_out = outbuf;
            strm->avail_out = sizeof(outbuf);
        }

        if (ret != LZMA_OK) {
            if (ret == LZMA_STREAM_END)
                return true;

            const char *msg;
            switch (ret) {
                case LZMA_MEM_ERROR:
                    msg = "Memory allocation failed";
                    break;

                case LZMA_DATA_ERROR:
                    msg = "File size limits exceeded";
                    break;

                default:
                    msg = "Unknown error, possibly a bug";
                    break;
            }

            fprintf(stderr, "Encoder error: %s (error code %u)\n",
                    msg, ret);
            return false;
        }
    }
}

static void usage(void)
{
    printf("Usage: ./xz_tool [OPTION]... [FILE]...\n");
    printf("Compress or decompress FILEs in the .xz format.\n");
    printf("\t-i,   input file name\n");
    printf("\t-v,   input file version\n");
    printf("\t-o,   output file name\n");
    printf("\t-h,   display this short help and exit\n");
    printf("\t-V,   display the version number and exit\n");

    return;
}

static int package(int fd_xz, const char *out_file)
{
    int ret = 0, fd = -1, i;
    uint8_t *out_buf = NULL;
    uint32_t out_buf_len = 0;
    uint32_t xz_ofs = 0, xz_file_length = 0, sum = 0;

    fd = open(out_file, O_CREAT | O_RDWR | O_TRUNC, 0666);
    if (fd < 0) {
        printf("create %s failed, %s\n", out_file, strerror(errno));
        return -1;
    }

    // xz file size
    xz_file_length = lseek(fd_xz, 0, SEEK_END);

    // 输出文件数据buffer = ota头 + 校验区<512> + xz压缩文件
    xz_ofs = sizeof(struct ota_header) + sizeof(struct ota_check_desc);
    out_buf_len = xz_ofs + xz_file_length;
    out_buf = (uint8_t *) malloc (out_buf_len);
    if (out_buf == NULL) {
        ret = -1;
        printf("malloc failed, %s\n", strerror(errno));
        goto FUNC_EXIT;
    }

    // 读取压缩文件数据到输出buffer, 偏移xz_ofs
    lseek(fd_xz, 0, SEEK_SET);
    read(fd_xz, &out_buf[xz_ofs], xz_file_length);

    for (i = 0; i < xz_file_length; i++) {
        sum += out_buf[xz_ofs + i];
    }

    header.magic = TUYA_OTA_HEADER_MAGIC;
    header.header_length = sizeof(header);
    header.ota_type = OTA_TYPE_COMPRESS;    // TODO
    memcpy(header.ota_dest, "app", 3);
    header.ota_file_len = sizeof(header) + sizeof(check) + xz_file_length;
    header.ota_file_verify_length = 4;      // TODO
    header.raw_data_len = raw_data_len;
    header.raw_data_verify_length = 4;

    uint8_t *tmp = (uint8_t *)&header;
    for (i = 0; i < sizeof(struct ota_header) - sizeof(uint32_t); i++) {
        header.header_sum += tmp[i];
    }

    check.ota_file_check_sum = sum;
    check.raw_data_check_sum = raw_data_sum;

    // 添加文件头到buffer
    memcpy(out_buf, &header, sizeof(struct ota_header));

    // 添加check到buffer
    memcpy(out_buf + sizeof(struct ota_header), &check, sizeof(struct ota_check_desc));

    write(fd, out_buf, out_buf_len);

FUNC_EXIT:
    if (fd != -1) {
        close(fd);
        fd = -1;
    }

    if (out_buf != NULL) {
        free(out_buf);
        out_buf = NULL;
    }

    return ret;
}

static int input_file_info(int fd_in, struct stat *s)
{
    uint32_t sum = 0;
    uint8_t *buf = (uint8_t *) malloc(s->st_size);
    if (buf == NULL) {
        printf("malloc failed, %s\n", strerror(errno));
        return -1;
    }

    read(fd_in, buf, s->st_size);

    for (int i = 0; i < s->st_size; i++) {
        sum += buf[i];
    }
    free (buf);
    buf = NULL;

    raw_data_len = s->st_size;
    raw_data_sum = sum;

    return 0;
}

static void header_dump(void)
{
    printf("\n========================================================================\n");
    printf("---------------------------------------------------------------------\n");
    printf("header length:          %x\r\n", header.header_length);
    printf("ota type:               %x\r\n", header.ota_type);
    printf("ota dest:               %s\r\n", header.ota_dest);
    printf("ota file len:           %x\r\n", header.ota_file_len);
    printf("ota_file_verify_length: %x\r\n", header.ota_file_verify_length);
    printf("raw_data_version:       %s\r\n", header.raw_data_version);
    printf("raw_data_len:           %x\r\n", header.raw_data_len);
    printf("raw_data_verify_length: %x\r\n", header.raw_data_verify_length);
    printf("header_sum:             %x\r\n", header.header_sum);
    printf("ota_sum:                %x\r\n", check.ota_file_check_sum);
    printf("app_sum:                %x\r\n", check.raw_data_check_sum);
    printf("---------------------------------------------------------------------\n");
    printf("========================================================================\n");
}

extern char *optarg;

int main(int argc, char *argv[])
{
    int opt, ret = 0;
    char *input_file_name = NULL;
    char *output_file_name = "ug.bin";
    char xz_file_name[128];
    int fd_in = -1, fd_xz = -1;
    struct stat s;

    memset(&header, 0, sizeof(header));

    while((opt = getopt(argc, argv, "i:v:Vh?")) != -1) {
        switch (opt) {
            case 'i':
                input_file_name = optarg;
                break;
            case 'v':
                strncpy(header.raw_data_version, optarg, 11);
                header.raw_data_version[11] = '\0';
                break;
            case 'V':
                printf("xz_tool 5.2.4\n");
                printf("liblzma 5.2.4\n");
                return 0;
            case 'h':
            default:
                usage();
                return 0;
        }
    }

    printf("header size: %ld\n", sizeof(header));

    if (input_file_name == NULL) {
        printf("No input file\n");
        usage();
        return -1;
    }

    if (header.raw_data_version[0] == 0) {
        printf("No spec version\n");
        usage();
        return -1;
    }

    printf("Input file: %s\n", input_file_name);
    printf("Final output file: ug.bin\n");

    memset(xz_file_name, 0, 128);
    sprintf(xz_file_name, "%s.xz", input_file_name);

    fd_in = open(input_file_name, O_RDONLY);
    if (fd_in == -1) {
        printf("Open input file error, %s\n", strerror(errno));
        ret = -1;
        goto ERROR_EXIT;
    }

    stat(input_file_name, &s);
    input_file_info(fd_in, &s);

    fd_xz = open(xz_file_name, O_RDWR | O_CREAT | O_TRUNC, 0666);
    if (fd_xz == -1) {
        printf("Create xz file error, %s %s\n", xz_file_name, strerror(errno));
        ret = -1;
        goto ERROR_EXIT;
    }

    lzma_stream strm = LZMA_STREAM_INIT;

    ret = init_encoder(&strm);
    if (ret)
        ret = compress(&strm, fd_in, fd_xz);

    lzma_end(&strm);

    ret = package(fd_xz, output_file_name);
    if (ret < 0) {
        ret = -1;
        printf("package failed\n");
        goto ERROR_EXIT;
    }

    header_dump();

ERROR_EXIT:

    if (fd_in != -1) {
        close(fd_in);
        fd_in = -1;
    }
    if (fd_xz) {
        close(fd_xz);
        fd_xz = -1;
    }

    return ret;
}
