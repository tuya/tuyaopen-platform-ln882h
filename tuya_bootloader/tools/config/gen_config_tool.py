#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# vim:fenc=utf-8

import argparse
import os
import struct
import sys
import re
"""

"""
ENDS = b'\xEB\xEB' + b'\xFF' * 14  # The first 2 bytes are like magic numbers for MD5 sum
MAX_LENGTH = 0x800   # 2K

class ConfigBin(list):
    def __init__(self):
        super(ConfigBin, self).__init__(self)

    @classmethod
    def from_file(cls, f):
        data = f.read().decode()
        return cls.from_csv(data)

    @classmethod
    def from_csv(cls, contents):
        res = ConfigBin()
        lines = contents.splitlines()

        def expand_vars(l):
            l = os.path.expandvars(l)
            m = re.match(r'(?<!\\)\$([A-Za-z_][A-Za-z0-9_]*)', l)
            if m:
                raise InputError("unknown variable '%s'" % m.group(1))
            return l

        for line_no in range(len(lines)):
            line = expand_vars(lines[line_no]).strip()
            if line.startswith('#') or len(line) == 0:
                continue
            try:
                res.append(ConfigBinDefinition.from_csv(line, line_no + 1))
            except InputError as err:
                raise InputError('Error at line %d: %s' % (line_no + 1, err))
            except Exception:
                critical('Unexpected error parsing CSV line %d: %s' % (line_no + 1, line))
                raise

        return res

    def to_binary(self):
        result = b''.join(e.to_binary() for e in self)
        result += ENDS + checksum(result)
        if len(result) > MAX_LENGTH:
            raise InputError('Binary file length (%d) too long' % len(result))
        result += b'\xFF' * (MAX_LENGTH - len(result))
        return result



class ConfigBinDefinition(object):
    MAGIC_BYTES = b'\x59\x54'

    def __init__(self):
        self.key = ''
        #self.value = 0
        self.value = ''

    @classmethod
    def from_csv(cls, line, line_no):
        """ Parse line from CSV """
        line_w_defaults = line + ' , ,'
        fields = [f.strip() for f in line_w_defaults.split(',')]

        if fields[1] == "":
            raise InputError("No value.");
        elif len(fields[1]) > 16:
            raise InputError("Value len is too lang, %d, limit 16 bytes" % len(fields[1]));

        res = ConfigBinDefinition()
        res.line_no = line_no
        res.key = fields[0]
        res.value = fields[1]

        return res

    STRUCT_FORMAT = b'2s14s16s'

    def to_binary(self):
        return struct.pack(self.STRUCT_FORMAT,
                           self.MAGIC_BYTES,
                           self.key.encode(),
                           self.value.encode())

    def __str__(self):
        return "Config [%s, %s]" % (self.key, self.value)

    def __repr__(self):
        return "Config [%s, %s]" % (self.key, self.value)



class InputError(RuntimeError):
    def __init__(self, e):
        super(InputError, self).__init__(e)

def checksum(data):
    xsum = 0
    for i in range(0, len(data)):
        xsum += data[i]
    return xsum.to_bytes(4, 'little', signed=False)

def critical(msg):
    """ Print critical message to stderr """
    sys.stderr.write(msg)
    sys.stderr.write('\n')


def main():
    print("Parse...")
    parser = argparse.ArgumentParser()

    parser.add_argument('input', help='Path to CSV file.', type=argparse.FileType('rb'))
    parser.add_argument('output', help='Path to bin file.', nargs='?', default='conf.bin')

    args = parser.parse_args()
    #output_dir = os.path.abspath(os.path.dirname(args.of))
    conf = ConfigBin.from_file(args.input)

    output = conf.to_binary()
    with open(args.output, 'wb') as f:
        f.write(output)

    print("Complete.")


if __name__ == '__main__':
    try:
        main()
    except InputError as e:
        print(e, file=sys.stderr)
        sys.exit(2)



