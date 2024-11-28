/****************************************************************************
 * @file flash_partition_table.c
 * @brief this module is used to flash_partition_table
 * @version 0.0.1
 * @date 2022-05-06
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>

#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


#include "flash_partition_table.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Private Type Declarations
 ****************************************************************************/

/****************************************************************************
 * Private Data Declarations
 ****************************************************************************/
char *type[] = {"code", "data", "lib"};
char *sub_type[3][8] = {
    {"boot", "app", "ate"},
    {"factory", "ota", "tuya_uf", "tuya_key", "tuya_kv", "tuya_cfg", "tuya_ext"},
    {"driver_flash"},
};

/****************************************************************************
 * Private Functions
 ****************************************************************************/
static void usage(void)
{
    printf("Usage: ./a.out -f [filename]\n");
}

static void display_item(struct item_desc *item)
{
    char *sub = NULL;

    printf("-------------------------------------------\n");
    printf("type [%d] = [%s]\n", item->type, type[item->type]);
    if (item->subtype == 0xfe || item->subtype > 7)
        sub = "undefined";
    else
        sub = sub_type[item->type][item->subtype];
    printf("subtype [%d] = [%s]\n", item->subtype, sub);
    printf("offset %x\n", item->ofs);
    printf("size %x\n", item->size);
    printf("name %s\n", item->name);
    printf("flag %x\n", item->flag);
    printf("-------------------------------------------\n");
}

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

int main(int argc, char *argv[])
{
    int opt, ret = 0;
    int fd = -1;
    uint16_t magic;
    ssize_t num;
    char *input = NULL;
    struct stat statbuf;
    struct item_desc *item = NULL;

    while ((opt = getopt(argc, argv, "f:h")) != -1) {
        switch (opt) {
            case 'f':
                input = optarg;
                break;
            case 'h':
            default:
                usage();
                return 0;
        }
    }

    if (input == NULL) {
        usage();
        return -1;
    }

    if (stat(input, &statbuf) == -1) {
        printf("stat failed, %s\n", strerror(errno));
        return -1;
    }

    if (statbuf.st_size < FLASH_TABLE_MIN_SIZE) {
        printf("invalid file, too short\n");
        return -1;
    }

    item = (struct item_desc *)calloc(1, sizeof(struct item_desc));
    if (item == NULL) {
        printf("malloc failed\n");
        ret = -1;
        goto err_exit;
    }

    fd = open(input, O_RDONLY);
    if (fd == -1) {
        printf("open file failed, %s\n", strerror(errno));
        ret = -1;
        goto err_exit;
    }

    do {
        memset(item, 0, sizeof(struct item_desc));
        num = read(fd, item, sizeof(struct item_desc));
        if (num != sizeof(struct item_desc)) {
            printf("read error, %s\n", strerror(errno));
            ret = -1;
            goto err_exit;
        }
        magic = item->magic[1] << 8 | item->magic[0];
        printf("read: %ld, magic: %x\n", num, magic);
        if (magic == FLASH_TABLE_MAGIC)
            display_item(item);
        else if (magic == 0xebeb) {
            printf("end\n");
        }

    } while(magic != 0xffff);

err_exit:
    if (item) {
        free(item);
        item = NULL;
    }

    if (fd != -1) {
        close(fd);
        fd = -1;
    }

    return ret;
}



