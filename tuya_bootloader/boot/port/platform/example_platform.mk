
# gcc c flags
CFLAGS += -mcpu=cortex-m4 -mthumb -mabi=aapcs -march=armv7e-m+fp -mfpu=fpv4-sp-d16 -mfloat-abi=hard -Wall -Wextra -Wundef -Wshadow -Wredundant-decls
CFLAGS += -Wstrict-prototypes -Wimplicit-function-declaration -Wmissing-prototypes -Wdouble-promotion -Wfloat-conversion -ffunction-sections
CFLAGS += -fdata-sections -fno-strict-aliasing -O1 -D NDEBUG -DLN882H --specs=nano.specs --specs=nosys.specs

# ld link flags
LINK_FLAGS +=  -Wl,--gc-sections -Wl,-Map=output/tuya_bootloader.map,--cref,--no-warn-mismatch -Wl,--print-memory-usage

