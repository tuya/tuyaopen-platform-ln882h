#! /bin/bash
#
# create_bootloader.sh
# Copyright (C) 2022 cc <cc@tuya>
#
# Distributed under terms of the MIT license.
#

col="\033[36m "
end=" \033[0m"

ua_file=$1
if [ ! -f build/$ua_file ]; then
    echo -e $col"NO UA File exist"$end
    exit
fi

ota_versoin=$2
if [ "x$ota_versoin" == "$x" ]; then
    echo -e $col"No version specified"$end
    exit
fi

if [ ! -d build ];then
    mkdir build
fi

if [ ! -f boot/output/tuya_bootloader.bin ]; then
    # create bootloader.bin
    echo -e $col"Compile..."$end
    cd boot
    make distclean
    rm -rf output
    make oldconfig
    if [ $? -ne 0 ]; then
        echo "make oldconfig failed"
        exit -1
    fi

    make
    if [ $? -ne 0 ]; then
        echo "make failed"
        exit -1
    fi

    cp output/tuya_bootloader.bin ../build
    cd -

else
    cp boot/output/tuya_bootloader.bin build
fi

# create config.bin
echo -e $col"Config file..."$end
cd tools/config
conf_csv_file=$(find . -maxdepth 1 -name *.csv)
num=$(ls -l $conf_csv_file | wc -l)
if [ $num -eq 0 ];then
    echo "No config csv file"
    exit -2
elif [ $num -ne 1 ];then
    echo "multiple file"
    exit -2
fi

python3 gen_config_tool.py $conf_csv_file
if [ ! -f "conf.bin" ];then
    echo "gen config bin file failed"
    exit -3
fi

cp conf.bin ../../build
cd -

# create flash table bin file
echo -e $col"flash table..."$end
cd tools/flash_table/genTool
conf_ft_file=$(find . -maxdepth 1 -name *.csv)
n=$(ls -l $conf_ft_file | wc -l)
if [ $n -eq 0 ];then
    echo "No flash table csv file"
    exit -4
elif [ $num -ne 1 ];then
    echo "multiple flash table file"
    exit -4
fi

start_address=$(grep -wnr boot $conf_ft_file | awk -F',' '{print $4}' | sed -n 's/ *//gp')
if [ "x$start_address" = "x" ];then
    start_address=0
fi
echo "python3 flash_partition_table.py $conf_ft_file --begin=$start_address"
python3 flash_partition_table.py $conf_ft_file --begin=$start_address
if [ ! -f "unknown_flash_table.bin" ];then
    echo "gen flash table bin file failed"
    exit -4
fi

cp unknown_flash_table.bin ../../../build
cd -

cd build

limit_size=24576    # 24k
bin_size=$(stat --format=%s tuya_bootloader.bin)
if [ $bin_size -gt $limit_size ];then
    echo "bin too big"
    exit -5
fi

pad_1=$(expr $limit_size - $bin_size)
pad_2=256

dd if=/dev/zero bs=1 count=$pad_1 | sed 's/\x00/\xff/g' > pad_1.bin 2>/dev/null
dd if=/dev/zero bs=1 count=$pad_2 | sed 's/\x00/\xff/g' > pad_2.bin 2>/dev/null

python3 ../tools/boot_package/after_build_for_boot.py -f tuya_bootloader.bin

cat tuya_bootloader.bin pad_1.bin conf.bin unknown_flash_table.bin > boot.bin
cat tuya_bootloader.bin pad_1.bin conf.bin unknown_flash_table.bin pad_2.bin $ua_file > qio.bin

ota_start_address=1155072   # 0x11a000
qio_size=$(stat --format=%s qio.bin)
pad_3=$(expr $ota_start_address - $qio_size)
dd if=/dev/zero bs=1 count=$pad_3 | sed 's/\x00/\xff/g' > pad_3.bin 2>/dev/null

if [ ! -f ../tools/xz_tool/xz_tool ]; then
    cd ../tools/xz_tool/; make; cd -;
fi
../tools/xz_tool/xz_tool -i $ua_file -v $ota_versoin

cat qio.bin pad_3.bin ug.bin > local_ota_test.bin

#rm -f pad_1.bin
#rm -f pad_2.bin
#rm -f pad_3.bin

cd -











