#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
# Copyright 2021 Shanghai Lightning Semiconductor Technology Co., LTD

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import argparse
import zlib
from boot_header import BootHeader


class BootPackager:
    def __init__(self) -> None:
        self.output         = None  # output filename, default is "boot_ram.bin"
        self.crp            = 0     # SWD CRP.

    def prepare(self, *args) -> bool:
        self.bin_filepath = args[0]
        if not os.path.exists(self.bin_filepath):
            print("Error: No such file {_f}".format(_f=self.bin_filepath))
            return False

        return True


    def doPackage(self) -> bool:
        # bin --- boot header crc ---> boot_ram.bin
        file_info = os.stat(self.bin_filepath)
        if file_info.st_size > BootHeader.BOOT_SIZE_LIMIT:
            print("Fatal Error: boot file size ({_bs} bytes) > boot partition size ({_ps} bytes)"
                .format(_bs=file_info.st_size, _ps=BootHeader.BOOT_SIZE_LIMIT))
            return False

        try:
            with open(self.bin_filepath, "rb+") as fObj:
                header_buf = fObj.read(BootHeader.BOOT_HEADER_SIZE)
                temp_boot_header = BootHeader(header_buf)
                temp_boot_header.bootram_bin_length = file_info.st_size

                if self.crp == 0:
                    temp_boot_header.crp_flag = 0
                else:
                    temp_boot_header.crp_flag = BootHeader.CRP_VALID_FLAG

                fObj.seek(temp_boot_header.bootram_crc_offset, os.SEEK_SET)
                body_buf = fObj.read()
                body_crc32 = zlib.crc32(body_buf)
                temp_boot_header.bootram_crc_value = body_crc32

                fObj.seek(0, os.SEEK_SET)
                fObj.write(temp_boot_header.toByteArray())
        except OSError as err:
            print("Error: read boot: {}".format(str(err)))
            return False
        return True


if __name__ == "__main__":

    prog = os.path.basename(__file__)
    desc = "bootloader packager"
    parser = argparse.ArgumentParser(prog=prog, description=desc)
    parser.add_argument("-f", "--file", help="boot bin filepath", type=str)
    parser.add_argument("-o", "--output",   help="output filename, default is 'boot.bin'", default="boot.bin",type=str)
    parser.add_argument("-c", "--crp",      help="swd crp flag (0--disable CRP, 1--enable, default is 0)")
    args = parser.parse_args()


    buildObj = BootPackager()

    if not buildObj.prepare(args.file, args.output):
        exit(-1)

    if not buildObj.doPackage():
        exit(-2)

    exit(0)

