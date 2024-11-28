#!/usr/bin/env python

from __future__ import division, print_function, unicode_literals

import argparse
import binascii
import errno
import hashlib
import os
import re
import struct
import sys

MAX_PARTITION_LENGTH = 0x800   # 2K
MD5_PARTITION_BEGIN = b'\xEB\xEB' + b'\xFF' * 14  # The first 2 bytes are like magic numbers for MD5 sum
PARTITION_TABLE_SIZE  = 0x800  # Size of partition table

MIN_PARTITION_SUBTYPE_APP_OTA = 0x10
NUM_PARTITION_SUBTYPE_APP_OTA = 16

__version__ = '1.2'

TYPE_CODE = 0x00
TYPE_DATA = 0x01
TYPE_LIB  = 0x02

TYPES = {
    'code': TYPE_CODE,
    'data': TYPE_DATA,
    'lib': TYPE_LIB,
}

def get_ptype_as_int(ptype):
    """ Convert a string which might be numeric or the name of a partition type to an integer """
    try:
        return TYPES[ptype]
    except KeyError:
        try:
            return int(ptype, 0)
        except TypeError:
            return ptype

SUBTYPES = {
    TYPE_CODE: {
        'boot': 0x01,
        'app': 0x02,
        'ate': 0x04,
    },
    TYPE_DATA: {
        'config': 0x01,
        'part_table': 0x02,
        'factory': 0x03,
        'ota': 0x04,
        'tuya_uf': 0x05,
        'tuya_key': 0x06,
        'tuya_kv': 0x07,
        'tuya_cfg': 0x08,
        'tuya_ext': 0x09,
        'undefined': 0xfe,
    },
    TYPE_LIB: {
        'flash': 0x01
    }
}


def get_subtype_as_int(ptype, subtype):
    """ Convert a string which might be numeric or the name of a partition subtype to an integer """
    try:
        return SUBTYPES[get_ptype_as_int(ptype)][subtype]
    except KeyError:
        try:
            return int(subtype, 0)
        except TypeError:
            return subtype

ALIGNMENT = {
    TYPE_CODE: 0x10,    # 32bits
    TYPE_DATA: 0x4,
    TYPE_LIB: 0x1000,   # 4k
}

def get_alignment_for_type(ptype):
    return ALIGNMENT.get(ptype, ALIGNMENT[TYPE_DATA])


start_of_table = 0


def status(msg):
    """ Print status message to stderr """
    critical(msg)


def critical(msg):
    """ Print critical message to stderr """
    sys.stderr.write(msg)
    sys.stderr.write('\n')


class PartitionTable(list):
    def __init__(self):
        super(PartitionTable, self).__init__(self)

    @classmethod
    def from_file(cls, f):
        data = f.read()
        data_is_binary = data[0:2] == PartitionDefinition.MAGIC_BYTES
        if data_is_binary:
            status('Parsing binary partition input...')
            return cls.from_binary(data), True

        data = data.decode()
        status('Parsing CSV input...')
        return cls.from_csv(data), False

    @classmethod
    def from_csv(cls, csv_contents):
        res = PartitionTable()
        lines = csv_contents.splitlines()

        def expand_vars(f):
            f = os.path.expandvars(f)
            m = re.match(r'(?<!\\)\$([A-Za-z_][A-Za-z0-9_]*)', f)
            if m:
                raise InputError("unknown variable '%s'" % m.group(1))
            return f

        for line_no in range(len(lines)):
            line = expand_vars(lines[line_no]).strip()
            if line.startswith('#') or len(line) == 0:
                continue
            try:
                res.append(PartitionDefinition.from_csv(line, line_no + 1))
            except InputError as err:
                raise InputError('Error at line %d: %s' % (line_no + 1, err))
            except Exception:
                critical('Unexpected error parsing CSV line %d: %s' % (line_no + 1, line))
                raise

        # fix up missing addresss & negative sizes
        #last_end = start_of_table + PARTITION_TABLE_SIZE  # first address after partition table
        last_end = start_of_table  # first address after partition table
        for e in res:
            if e.address is not None and e.address < last_end:
                if e != res[0]:
                    raise InputError('CSV Error: Partitions overlap. Partition at line %d sets address 0x%x. Previous partition ends 0x%x'
                                     % (e.line_no, e.address, last_end))
            if e.address is None:
                pad_to = get_alignment_for_type(e.type)
                if last_end % pad_to != 0:
                    last_end += pad_to - (last_end % pad_to)
                e.address = last_end
            if e.size < 0:
                e.size = -e.size - e.address
            last_end = e.address + e.size

            if e.offset is None:
                e.offset = 0

        return res

    def __getitem__(self, item):
        """ Allow partition table access via name as well as by
        numeric index. """
        if isinstance(item, str):
            for x in self:
                if x.name == item:
                    return x
            raise ValueError("No partition entry named '%s'" % item)
        else:
            return super(PartitionTable, self).__getitem__(item)

    def find_by_type(self, ptype, subtype):
        """ Return a partition by type & subtype, returns
        None if not found """
        # convert ptype & subtypes names (if supplied this way) to integer values
        ptype = get_ptype_as_int(ptype)
        subtype = get_subtype_as_int(ptype, subtype)

        for p in self:
            if p.type == ptype and p.subtype == subtype:
                yield p
        return

    def find_by_name(self, name):
        for p in self:
            if p.name == name:
                return p
        return None

    def verify(self):
        # verify each partition individually
        for p in self:
            p.verify()

        # check on duplicate name
        names = [p.name for p in self]
        duplicates = set(n for n in names if names.count(n) > 1)

        # print sorted duplicate partitions by name
        if len(duplicates) != 0:
            critical('A list of partitions that have the same name:')
            for p in sorted(self, key=lambda x:x.name):
                if len(duplicates.intersection([p.name])) != 0:
                    critical('%s' % (p.to_csv()))
            raise InputError('Partition names must be unique')

        # check for overlaps
        last = None
        for p in sorted(self, key=lambda x:x.address):
#            if p.address < start_of_table + PARTITION_TABLE_SIZE:
#                raise InputError('Partition address 0x%x is below 0x%x' % (p.address, start_of_table + PARTITION_TABLE_SIZE))
            if last is not None and p.address < last.address + last.size:
                raise InputError('Partition at 0x%x overlaps 0x%x-0x%x' % (p.address, last.address, last.address + last.size - 1))
            last = p

        # check that otadata should be unique
        ota_duplicates = [p for p in self if p.type == TYPES['data'] and p.subtype == SUBTYPES[TYPE_DATA]['ota']]
        if len(ota_duplicates) > 1:
            for p in ota_duplicates:
                critical('%s' % (p.to_csv()))
            raise InputError('Found multiple ota partitions. Only one partition can be defined with type="data" and subtype="ota".')

    def flash_size(self):
        """ Return the size that partitions will occupy in flash
            (ie the address the last partition ends at)
        """
        try:
            last = sorted(self, reverse=True)[0]
        except IndexError:
            return 0  # empty table!
        return last.address + last.size

    def verify_size_fits(self, flash_size_bytes: int) -> None:
        """ Check that partition table fits into the given flash size.
            Raises InputError otherwise.
        """
        table_size = self.flash_size()
        if flash_size_bytes < table_size:
            mb = 1024 * 1024
            raise InputError('Partitions tables occupies %.1fMB of flash (%d bytes) which does not fit in configured '
                             "flash size %dMB. Change the flash size in menuconfig under the 'Serial Flasher Config' menu." %
                             (table_size / mb, table_size, flash_size_bytes / mb))

    @classmethod
    def from_binary(cls, b):
        md5 = hashlib.md5()
        result = cls()
        for o in range(0,len(b),32):
            data = b[o:o + 32]
            if len(data) != 32:
                raise InputError('Partition table length must be a multiple of 32 bytes')
            if data == b'\xFF' * 32:
                return result  # got end marker
            if data[:2] == MD5_PARTITION_BEGIN[:2]:  # check only the magic number part
                if data[16:] == md5.digest():
                    continue  # the next iteration will check for the end marker
                else:
                    raise InputError("MD5 checksums don't match! (computed: 0x%s, parsed: 0x%s)" % (md5.hexdigest(), binascii.hexlify(data[16:])))
            else:
                md5.update(data)
            result.append(PartitionDefinition.from_binary(data))
        raise InputError('Partition table is missing an end-of-table marker')

    def to_binary(self):
        for e in self:
            print (e)

        result = b''.join(e.to_binary() for e in self)
        result += MD5_PARTITION_BEGIN + checksum(result)
        if len(result) >= MAX_PARTITION_LENGTH:
            raise InputError('Binary partition table length (%d) longer than max' % len(result))
        result += b'\xFF' * (MAX_PARTITION_LENGTH - len(result))  # pad the sector, for signing
        return result

    def to_csv(self, simple_formatting=False):
        rows = ['# Flash Partition Table',
                '# Name, Type, SubType, address, Size, Flags']
        rows += [x.to_csv(simple_formatting) for x in self]
        return '\n'.join(rows) + '\n'


class PartitionDefinition(object):
    MAGIC_BYTES = b'\x59\x54'

    # dictionary maps flag name (as used in CSV flags list, property name)
    # to bit set in flags words in binary format
    FLAGS = {
        'encrypted': 0
    }

    # add subtypes for the 16 OTA slot values ("ota_XX, etc.")
    for ota_slot in range(NUM_PARTITION_SUBTYPE_APP_OTA):
        SUBTYPES[TYPES['data']]['ota_%d' % ota_slot] = MIN_PARTITION_SUBTYPE_APP_OTA + ota_slot

    def __init__(self):
        self.name = ''
        self.type = None
        self.subtype = None
        self.address = None
        self.size = None
        self.encrypted = False

    @classmethod
    def from_csv(cls, line, line_no):
        """ Parse a line from the CSV """
        line_w_defaults = line + ',,,,'  # lazy way to support default fields
        fields = [f.strip() for f in line_w_defaults.split(',')]

        res = PartitionDefinition()
        res.line_no = line_no
        res.name = fields[0]
        res.type = res.parse_type(fields[1])
        res.subtype = res.parse_subtype(fields[2])
        res.address = res.parse_address(fields[3])
        res.size = res.parse_address(fields[4])
        res.offset = res.parse_address(fields[5])
        if res.size is None:
            raise InputError("Size field can't be empty")

        flags = fields[6].split(':')
        for flag in flags:
            if flag in cls.FLAGS:
                setattr(res, flag, True)
            elif len(flag) > 0:
                raise InputError("CSV flag column contains unknown flag '%s'" % (flag))

        return res

    def __eq__(self, other):
        return self.name == other.name and self.type == other.type \
            and self.subtype == other.subtype and self.address == other.address \
            and self.size == other.size

    def __repr__(self):
        def maybe_hex(x):
            return '0x%x' % x if x is not None else 'None'
        return "PartitionDefinition(%s, 0x%x, 0x%x, %s, %s, %s)" % (self.name, self.type, self.subtype or 0,
                                                                  maybe_hex(self.address), maybe_hex(self.size), maybe_hex(self.offset))

    def __str__(self):
        return "Part: %s %d/%d @ 0x%x size 0x%x offset 0x%x" % (self.name, self.type, self.subtype, self.address, self.size, self.offset)

    def __cmp__(self, other):
        return self.address - other.address

    def __lt__(self, other):
        return self.address < other.address

    def __gt__(self, other):
        return self.address > other.address

    def __le__(self, other):
        return self.address <= other.address

    def __ge__(self, other):
        return self.address >= other.address

    def parse_type(self, strval):
        if strval == '':
            raise InputError("Field 'type' can't be left empty.")
        return parse_int(strval, TYPES)

    def parse_subtype(self, strval):
        if strval == '':
            if self.type == TYPES['code']:
                raise InputError('Code partition cannot have an empty subtype')
            return SUBTYPES[TYPE_DATA]['undefined']
        return parse_int(strval, SUBTYPES.get(self.type, {}))

    def parse_address(self, strval):
        if strval == '':
            return None  # PartitionTable will fill in default
        return parse_int(strval)

    def verify(self):
        if self.type is None:
            raise ValidationError(self, 'Type field is not set')
        if self.subtype is None:
            raise ValidationError(self, 'Subtype field is not set')
        if self.address is None:
            raise ValidationError(self, 'address field is not set')
        align = get_alignment_for_type(self.type)
        if self.address % align:
            raise ValidationError(self, 'address 0x%x is not aligned to 0x%x' % (self.address, align))
        if self.size % align:
            raise ValidationError(self, 'Size 0x%x is not aligned to 0x%x' % (self.size, align))
        if self.size is None:
            raise ValidationError(self, 'Size field is not set')

        if self.name in TYPES and TYPES.get(self.name, '') != self.type:
            critical("WARNING: Partition has name '%s' which is a partition type, but does not match this partition's "
                     'type (0x%x). Mistake in partition table?' % (self.name, self.type))
        all_subtype_names = []
        for names in (t.keys() for t in SUBTYPES.values()):
            all_subtype_names += names
        if self.name in all_subtype_names and SUBTYPES.get(self.type, {}).get(self.name, '') != self.subtype:
            critical("WARNING: Partition has name '%s' which is a partition subtype, but this partition has "
                     'non-matching type 0x%x and subtype 0x%x. Mistake in partition table?' % (self.name, self.type, self.subtype))

    STRUCT_FORMAT = b'<2sBBLLH14sL'

    @classmethod
    def from_binary(cls, b):
        if len(b) != 32:
            raise InputError('Partition definition length must be exactly 32 bytes. Got %d bytes.' % len(b))
        res = cls()
        (magic, res.type, res.subtype, res.address,
         res.size, res.name, flags) = struct.unpack(cls.STRUCT_FORMAT, b)
        if b'\x00' in res.name:  # strip null byte padding from name string
            res.name = res.name[:res.name.index(b'\x00')]
        res.name = res.name.decode()
        if magic != cls.MAGIC_BYTES:
            raise InputError('Invalid magic bytes (%r) for partition definition' % magic)
        for flag,bit in cls.FLAGS.items():
            if flags & (1 << bit):
                setattr(res, flag, True)
                flags &= ~(1 << bit)
        if flags != 0:
            critical('WARNING: Partition definition had unknown flag(s) 0x%08x. Newer binary format?' % flags)
        return res

    def get_flags_list(self):
        return [flag for flag in self.FLAGS.keys() if getattr(self, flag)]

    def to_binary(self):
        flags = sum((1 << self.FLAGS[flag]) for flag in self.get_flags_list())
        return struct.pack(self.STRUCT_FORMAT,
                           self.MAGIC_BYTES,
                           self.type, self.subtype,
                           self.address, self.size,
                           self.offset, self.name.encode(), flags)

    def to_csv(self, simple_formatting=False):
        def addr_format(a, include_sizes):
            if not simple_formatting and include_sizes:
                for (val, suffix) in [(0x100000, 'M'), (0x400, 'K')]:
                    if a % val == 0:
                        return '%d%s' % (a // val, suffix)
            return '0x%x' % a

        def lookup_keyword(t, keywords):
            for k,v in keywords.items():
                if simple_formatting is False and t == v:
                    return k
            return '%d' % t

        def generate_text_flags():
            """ colon-delimited list of flags """
            return ':'.join(self.get_flags_list())

        return ','.join([self.name,
                         lookup_keyword(self.type, TYPES),
                         lookup_keyword(self.subtype, SUBTYPES.get(self.type, {})),
                         addr_format(self.address, False),
                         addr_format(self.size, True),
                         generate_text_flags()])


def checksum(data):
    xsum = 0
    for i in range(0, len(data)):
        xsum += data[i]
    return xsum.to_bytes(4,'little',signed=False)


def parse_int(v, keywords={}):
    """Generic parser for integer fields - int(x,0) with provision for
    k/m/K/M suffixes and 'keyword' value lookup.
    """
    try:
        for letter, multiplier in [('k', 1024), ('m', 1024 * 1024)]:
            if v.lower().endswith(letter):
                return parse_int(v[:-1], keywords) * multiplier
        return int(v, 0)
    except ValueError:
        if len(keywords) == 0:
            raise InputError('Invalid field value %s' % v)
        try:
            return keywords[v.lower()]
        except KeyError:
            raise InputError("Value '%s' is not valid. Known keywords: %s" % (v, ', '.join(keywords)))


def main():
    global start_of_table
    parser = argparse.ArgumentParser(description='Flash partition table utility')

    parser.add_argument('--flash-size', help='Optional flash size limit, checks partition table fits in flash',
                        nargs='?', choices=['1MB', '2MB', '4MB', '8MB', '16MB', '32MB', '64MB', '128MB'])
    parser.add_argument('--no-verify', help="Don't verify partition table fields", action='store_true')
    parser.add_argument('--verify', '-v', help='Verify partition table fields (deprecated, this behaviour is '
                                               'enabled by default and this flag does nothing.', action='store_true')
    parser.add_argument('--begin', '-b', help='Set start address of partition', default='0x00')
    parser.add_argument('input', help='Path to CSV or binary file to parse.', type=argparse.FileType('rb'))
    parser.add_argument('output', help='Path to output converted binary or CSV file.', nargs='?', default='unknown_flash_table.bin')

    args = parser.parse_args()

    start_of_table = int(args.begin, 0)
    table, input_is_binary = PartitionTable.from_file(args.input)

    if not args.no_verify:
        status('Verifying table...')
        table.verify()

    if args.flash_size:
        size_mb = int(args.flash_size.replace('MB', ''))
        table.verify_size_fits(size_mb * 1024 * 1024)

    # Make sure that the output directory is created
    output_dir = os.path.abspath(os.path.dirname(args.output))

    if not os.path.exists(output_dir):
        try:
            os.makedirs(output_dir)
        except OSError as exc:
            if exc.errno != errno.EEXIST:
                raise

    if input_is_binary:
        output = table.to_csv()
        with sys.stdout if args.output == '-' else open(args.output, 'w') as f:
            f.write(output)
    else:
        output = table.to_binary()
        try:
            stdout_binary = sys.stdout.buffer  # Python 3
        except AttributeError:
            stdout_binary = sys.stdout
        with stdout_binary if args.output == '-' else open(args.output, 'wb') as f:
            f.write(output)


class InputError(RuntimeError):
    def __init__(self, e):
        super(InputError, self).__init__(e)


class ValidationError(InputError):
    def __init__(self, partition, message):
        super(ValidationError, self).__init__(
            'Partition %s invalid: %s' % (partition.name, message))


if __name__ == '__main__':
    try:
        main()
    except InputError as e:
        print(e, file=sys.stderr)
        sys.exit(2)
