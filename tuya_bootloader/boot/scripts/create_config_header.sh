#!/bin/sh

set -e

src=$1
dest=$2

if [ -f $dest ]; then
    rm $dest
fi

create_config_header() {
    echo "/**" > $2
    echo " * Automatically generated file; DO NOT EDIT." >> $2
    echo " * TuYa Configuration" >> $2
    echo " */" >> $2
    echo "" >> $2

    sed -n '/^CONFIG_/p' $1 | awk -F'=' 'BEGIN{printf "#ifndef __TUYA_BOOTLOADER_CONF_H__\n#define __TUYA_BOOTLOADER_CONF_H__\n\n"}''{printf "#define" " " $1 " "}''{if ($2=="y") print "1"; else printf "%s\n",$2}''END{printf "\n#endif"}' >> $2
    echo "" >> $2
}

create_config_header ${src} ${dest}

