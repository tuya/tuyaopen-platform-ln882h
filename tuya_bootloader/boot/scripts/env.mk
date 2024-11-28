#
# env.mk
# cc, 2022-05-24 11:25
#

# toolchain define
TOOLCHAIN = $(shell echo ${CONFIG_TOOLCHAIN_PATH})
CC=${TOOLCHAIN}-gcc
AR=${TOOLCHAIN}-ar
READELF=${TOOLCHAIN}-readelf
OBJDUMP=${TOOLCHAIN}-objdump
OBJCOPY=${TOOLCHAIN}-objcopy

config:
	@if [ ! -f .config ]; then \
		echo "\033[31mNo .config file, make menuconfig first\033[0m"; \
		exit 1; \
	fi


env: config
	#TOOLCHAIN = ${TOOLCHAIN}
	@tmp=$$(sh scripts/cc-version.sh ${TOOLCHAIN}-gcc); \
	if [ "x$${tmp}" != "xpass" ]; then \
		echo "unknown compiler: ${TOOLCHAIN}-gcc" >&2; \
		exit 1; \
	fi

	#LD SCRIPT: ${CONFIG_LD_SCRIPT_PATH}
	@if [ "x${CONFIG_LD_SCRIPT_PATH}" = "x" ]; then \
		echo "Not defined ld script file"; \
		exit 1; \
	elif [ ! -f ${CONFIG_LD_SCRIPT_PATH} ]; then \
		echo "Not found ld script file"; \
		exit 1; \
	fi

	#COMPILE PARAMETER FILE: ${CONFIG_PLATFORM_COMPILE_PARAMETERS}
	@if [ "x${CONFIG_PLATFORM_COMPILE_PARAMETERS}" = "x" ]; then \
		echo "Not defined compile parameter file"; \
		exit 1; \
	elif [ ! -f $${CONFIG_PLATFORM_COMPILE_PARAMETERS} ]; then \
		echo "Not found compile parameter file"; \
		exit 1; \
	fi



bl_config.h: .config
	#-------- $@
	@sh scripts/create_config_header.sh $< $@

# vim:ft=make
#
