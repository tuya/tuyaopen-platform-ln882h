#
# Makefile
# cc, 2022-05-23 14:16
#
#
#

all: _all

-include .config
mk_file = $(shell echo ${CONFIG_PLATFORM_COMPILE_PARAMETERS})
-include ${mk_file}

include scripts/env.mk
include scripts/compile.mk
include port/external_source_files.mk

SRCS += $(wildcard src/*.c)
SRCS += $(wildcard src/heap/*.c)
SRCS += $(wildcard src/utils/*.c)
SRCS += $(wildcard src/xz_lib/*.c)
SRCS += $(wildcard src/xz_lib/xz/*.c)

SRCS += $(shell find port -name "*.c" -o -name "*.s" -o -name "*.S")

SOURCE_DIR = $(sort $(dir ${SRCS}))

VPATH := ${SOURCE_DIR} test

INCLUDES += -I .
INCLUDES += -I include
INCLUDES += -I port
INCLUDES += -I src/heap
INCLUDES += -I src/utils
INCLUDES += -I src/xz_lib
INCLUDES += -I src/xz_lib/xz

OBJS += $(patsubst %.c, ${OUTDIR}/%.o, $(filter %.c, $(notdir ${SRCS})))
OBJS += $(patsubst %.s, ${OUTDIR}/%.o, $(filter %.s, $(notdir ${SRCS})))
OBJS += $(patsubst %.S, ${OUTDIR}/%.o, $(filter %.S, $(notdir ${SRCS})))

DEPS = $(patsubst %.c, ${OUTDIR}/%.d, $(filter %.c, $(notdir ${SRCS})))

_all: env ${OBJS}
	@${CC} ${PLATFORM_COMPILE_FLAGS} ${INCLUDES} ${OBJS} -L ${LINK_LIBRARY_PATH} -Wl,--start-group ${LINK_LIBS} -Wl,--end-group -T ${LD_SCRIPT_FILE} -o ${ELF}
	@${READELF} -s ${ELF} | sed -n '/^ \+[0-9]\+/p' | sort -n -k 3 > ${SYM}
	@${OBJDUMP} -d ${ELF} > ${ASM}
	@${OBJCOPY} -O binary ${ELF} ${BIN}

menuconfig:
	@kconfig-mconf Kconfig

oldconfig:
	@if [ -f port/platform/default_config ]; then \
		cp port/platform/default_config .config; \
	else \
		echo "No default config file"; \
		exit 1; \
	fi



.PHONY: all menuconfig clean distclean force env config
clean:
	@rm -f ${OBJS} output/*.map ${ELF} ${BIN} ${SYM} ${ASM}

distclean: clean
	@rm -f ${DEPS} bl_config.h .config*
	@rm -rf ${OUTDIR}


-include ${DEPS}

# vim:ft=make
#
