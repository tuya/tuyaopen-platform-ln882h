
TOPDIR = $(shell pwd)
CUR_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
TUYA_TOOLCHAIN_PRE ?= ../../tools/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-

ifeq ($(V),1)
Q =
else
Q = @
endif

TOOLCHAIN=${TUYA_TOOLCHAIN_PRE}
CC = ${TOOLCHAIN}gcc
OBJCOPY = ${TOOLCHAIN}objcopy
OBJDUMP = ${TOOLCHAIN}objdump

all: package

build_dir = output

CFLAGS += -mcpu=cortex-m4 -mthumb -mabi=aapcs -march=armv7e-m+fp -mfpu=fpv4-sp-d16 -mfloat-abi=hard -Wall -Wextra \
			-Wimplicit-function-declaration -Wdouble-promotion -Wfloat-conversion -ffunction-sections \
			 -fdata-sections -fno-strict-aliasing -O1 -D NDEBUG -u _printf_float -u _scanf_float -Wl,--gc-sections -Wno-enum-conversion -fsigned-char\
			-Wunknown-pragmas -Wno-unused-function -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable -Wno-enum-compare -Wno-format-zero-length -Wno-sign-compare


LINKER_FLAGS += -specs=nano.specs -specs=nosys.specs -Wl,-Map=${build_dir}/${APP_BIN_NAME}_${APP_VERSION}.map,--cref,--no-warn-mismatch -Wl,--print-memory-usage

LD_FILE = ${TOPDIR}/ln882h/ln882h.ld
#--------------------- ln882h sdk files ------------------------------
include ln882h_source_files.mk
# $(info ==================)
# $(info ${LN882H_SRCS_TMP})
# $(info ==================)
#--------------------- tuya source files && sdk ----------------------

TUYA_SDK_LIB = $(addprefix -l, $(LIBS))
TUYA_SDK_LIB_PATH = ${LIBS_DIR}

TUYA_INCLUDES = ${HEADER_DIR}
TUYA_INCLUDES += ${TOPDIR}/../tuyaos/tuyaos_adapter/include
TUYA_INCLUDES += ${TOPDIR}/../tuyaos/tuyaos_adapter/include/utilities/include
TUYA_INCLUDES += ${TOPDIR}/../tuyaos/tuyaos_adapter/include/uart
TUYA_INCLUDES += ${TOPDIR}/../tuyaos/tuyaos_adapter/include/wifi
TUYA_INCLUDES += ${TOPDIR}/../tuya_bootloader/include

TY_SRC_DIRS += $(shell find ${TOPDIR}/../tuyaos/tuyaos_adapter/src -type d)
TY_SRC_DIRS += $(shell find ${TOPDIR}/../tuyaos/tuyaos_adapter/include -type d)

TUYA_SRCS += $(foreach dir, $(TY_SRC_DIRS), $(wildcard $(dir)/*.c)) # need export
TUYA_SRCS += $(foreach dir, $(TY_SRC_DIRS), $(wildcard $(dir)/*.cpp)) 
TUYA_SRCS += $(foreach dir, $(TY_SRC_DIRS), $(wildcard $(dir)/*.s)) 
TUYA_SRCS += $(foreach dir, $(TY_SRC_DIRS), $(wildcard $(dir)/*.S)) 

TUYA_INCLUDES += $(shell find ../tuyaos/tuyaos_adapter/include -type d)

CFLAGS += -DUSER_SW_VER=\"$(USER_SW_VER)\" -DAPP_BIN_NAME=\"$(APP_BIN_NAME)\" -DLN882H -DARM_MATH_CM4

ifeq (${USE_LN_LWIP},1)
CFLAGS += -DENABLE_LN_LWIP=1
endif

ifeq (${USER_FORCE_ENTER_ATE},1)
CFLAGS += -DFORCE_ENTER_ATE
endif

INCLUDES += $(addprefix -I , ${TUYA_INCLUDES})
INCLUDES += $(addprefix -I , ${LN882H_INCLUDES})

SRCS += ${TUYA_SRCS}
SRCS += ${LN882H_SRCS}

TUYA_OBJS = $(patsubst %.c, %.o, ${TUYA_SRCS})
LN882H_OBJS = $(patsubst %.c, %.o, ${LN882H_SRCS})

OBJS = ${TUYA_OBJS} ${LN882H_OBJS}
#OBJS = $(patsubst %.c, %.o, ${SRCS})
DEPS = $(SRCS:.c=.d)

LN_LIBS = ${LN882H_LIB} ${TUYA_SDK_LIB}
LN_LIBS_PATH = $(addprefix -L , ${LN882H_LIB_PATH} ${TUYA_SDK_LIB_PATH})

$(TUYA_OBJS): %.o: %.c
	${Q} ${CC} ${CFLAGS} ${INCLUDES} -c $< -o $@

$(LN882H_OBJS): %.o: %.c
	${Q} ${CC} ${CFLAGS} ${INCLUDES} -c $< -o $@

%.d: %.c
	@set -e; rm -f $@; \
	$(CC) $(CFLAGS) ${INCLUDES} $< -MM -MT "$(basename $<).d $(basename $<).o" > $@

before_build_script = ${CUR_DIR}/package-tools/python_scripts/before_build_gcc.py
rewrite_ln882h_linker_script = ${CUR_DIR}/package-tools/python_scripts/rewrite_ln882x_linker_script.py

${CUR_DIR}/ln882h/ln882h.ld ${CUR_DIR}/ln882h/cfg/flash_partition_table.h: ${CUR_DIR}/ln882h/cfg/flash_partition_cfg.json
	${Q} python3 ${before_build_script} -p ${CUR_DIR}/ln882h/cfg/flash_partition_cfg.json -o ${CUR_DIR}/ln882h/cfg/flash_partition_table.h
	${Q} python3 ${rewrite_ln882h_linker_script} ${CUR_DIR}/ln882h/cfg/flash_partition_cfg.json ${CUR_DIR}/ln882h/ln882h.ld

elf: ${OBJS} ${CUR_DIR}/ln882h/ln882h.ld ${CUR_DIR}/ln882h/cfg/flash_partition_table.h
	mkdir -p ${build_dir}
	${Q} $(CC) ${CFLAGS} ${INCLUDES} ${OBJS} ${LINKER_FLAGS} ${LN_LIBS_PATH} -Wl,--start-group ${LN_LIBS} -Wl,--end-group -T ${LD_FILE} -o ${build_dir}/${APP_BIN_NAME}_${APP_VERSION}.elf
	${Q} ${OBJDUMP} -dS ${build_dir}/${APP_BIN_NAME}_${APP_VERSION}.elf > ${build_dir}/${APP_BIN_NAME}_${APP_VERSION}.asm

after_build_script = ${CUR_DIR}/package-tools/python_scripts/after_build_gcc.py
sdkroot_dir = ${CUR_DIR}/
userproj_dir = ${CUR_DIR}/ln882h
elf_dir = ${CUR_DIR}/output

package: elf
	${Q} echo "Start Pack"
#	${Q} python3 ${after_build_script} \
		--sdkroot_dir ${sdkroot_dir} \
		--userproj_dir ${userproj_dir} \
		--buildout_dir ${elf_dir} \
		--buildout_name ${APP_BIN_NAME} \
		--output flashimage.bin
	${Q} ${OBJCOPY} -Obinary ${build_dir}/${APP_BIN_NAME}_${APP_VERSION}.elf ${build_dir}/${APP_BIN_NAME}_UA_${APP_VERSION}.bin; \
		if [ ! -d ../tuya_bootloader/build ]; then mkdir -p ../tuya_bootloader/build; fi; \
		cp ${build_dir}/${APP_BIN_NAME}_UA_${APP_VERSION}.bin ../tuya_bootloader/build; \
		d=$(pwd); \
		cd ../tuya_bootloader; \
		bash create_bootloader.sh "${APP_BIN_NAME}_UA_${APP_VERSION}.bin" "${APP_VERSION}"; \
		cp build/ug.bin ../ln882h_os/output/${APP_BIN_NAME}_UG_${APP_VERSION}.bin; \
		cp build/qio.bin ../ln882h_os/output/${APP_BIN_NAME}_QIO_${APP_VERSION}.bin; \
		cd ${d}



.PHONY: all clean package elf prebuild

clean:
	${Q} -rm -rf ${OBJS} ${DEPS} output/*
	${Q} -rm -rf ${TOPDIR}/apps/${app}/output/*

-include ${DEPS}

