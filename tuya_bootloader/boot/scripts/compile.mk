#
# compile.mk
# cc, 2022-05-24 17:22
#

# target define
OUTDIR = output
TARGET ?= ${OUTDIR}/tuya_bootloader
ELF = ${TARGET}.elf
BIN = ${TARGET}.bin
SYM = ${TARGET}.sym
ASM = ${TARGET}.asm

tmp = $(shell if [ ! -d ${OUTDIR} ]; then echo "noexist"; else echo "exists"; fi)
ifeq ("${tmp}", "noexist")
$(shell mkdir ${OUTDIR})
endif

PLATFORM_COMPILE_FLAGS += ${CFLAGS} ${LINK_FLAGS}

# linker
LD_SCRIPT_FILE = $(shell echo ${CONFIG_LD_SCRIPT_PATH})
LINK_LIBRARY_PATH += .
LINK_LIBS += -lc -lm -lnosys -lgcc

${OUTDIR}/%.o: %.c bl_config.h
	#compile $< ---> $@
	@${CC} ${PLATFORM_COMPILE_FLAGS} ${INCLUDES} -c $< -o $@

${OUTDIR}/%.o: %.s bl_config.h
	#compile $< ---> $@
	@${CC} ${PLATFORM_COMPILE_FLAGS} ${INCLUDES} -c $< -o $@

${OUTDIR}/%.o: %.S bl_config.h
	#compile $< ---> $@
	@${CC} ${PLATFORM_COMPILE_FLAGS} ${INCLUDES} -c $< -o $@

${OUTDIR}/%.d: %.c bl_config.h
	@${CC} ${PLATFORM_COMPILE_FLAGS} ${INCLUDES} $< -MM -MT "$@ $(patsubst %.c, %, $<).o" > $@

# vim:ft=make
#
