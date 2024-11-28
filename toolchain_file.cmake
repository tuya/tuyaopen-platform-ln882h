##
# @file toolchain_file.cmake
# @brief 
#/

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR Linux)

set(TOOLCHAIN_DIR "${PLATFORM_PATH}/../tools/gcc-arm-none-eabi-10.3-2021.10")
set(TOOLCHAIN_PRE "arm-none-eabi-")

# set(TOOLCHAIN_INCLUDE
#     ${TOOLCHAIN_DIR}/include
#     )
# set(TOOLCHAIN_LIB
#     ${TOOLCHAIN_DIR}/lib/gcc
#     )

message(STATUS "[TOP] PLATFORM_PATH: ${PLATFORM_PATH}")

set(CMAKE_AR "${TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PRE}ar")
set(CMAKE_C_COMPILER "${TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PRE}gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_DIR}/bin/${TOOLCHAIN_PRE}g++")

SET (CMAKE_C_COMPILER_WORKS 1)
SET (CMAKE_CXX_COMPILER_WORKS 1)

set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_DIR}/bin)

set(CMAKE_C_FLAGS "-mcpu=cortex-m4 -mthumb -mabi=aapcs -march=armv7e-m+fp -mfpu=fpv4-sp-d16 -mfloat-abi=hard -Wall -Wextra \
			-Wimplicit-function-declaration -Wdouble-promotion -Wfloat-conversion -ffunction-sections \
			-fdata-sections -fno-strict-aliasing -O1 -D NDEBUG -u _printf_float -u _scanf_float -Wl,--gc-sections -Wno-enum-conversion -fsigned-char \
			-Wunknown-pragmas -Wno-unused-function -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable -Wno-sign-compare")
