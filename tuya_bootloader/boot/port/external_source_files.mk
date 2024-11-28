#
# external_source_files.mk
# cc, 2022-05-25 13:44
#
#
PLATFORM_COMPILE_FLAGS += -D NDEBUG -DLN882H -DARM_MATH_CM4

# 如果使用相对路径，则相对路径基于顶层Makefile所在目录

# 添加源文件
#
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_cache.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_dma.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_flash.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_qspi.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_rtc.c

SRCS += ../../ln882h_os/ln882h/components/utils/debug/log.c
SRCS += ../../ln882h_os/ln882h/components/utils/reboot_trace/reboot_trace.c
SRCS += ../../ln882h_os/ln882h/components/utils/wrap_stdio.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_common.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_clock.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_gpio.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_misc.c
SRCS += ../../ln882h_os/ln882h/mcu/driver_ln882h/hal/hal_uart.c
SRCS += ../../ln882h_os/ln882h/mcu/ln882h/system_ln882h.c


# 指定头文件路径，注意需要添加 -I 参数
#
INCLUDES += -I ../../ln882h_os/ln882h/components
INCLUDES += -I ../../ln882h_os/ln882h/components/kernel
INCLUDES += -I ../../ln882h_os/ln882h/components/kernel/FreeRTOS/Source/include
INCLUDES += -I ../../ln882h_os/ln882h/components/kernel/FreeRTOS/Source/portable/GCC/ARM_CM4F
INCLUDES += -I ../../ln882h_os/ln882h/components/serial
INCLUDES += -I ../../ln882h_os/ln882h/init
INCLUDES += -I ../../ln882h_os/ln882h/mcu/CMSIS_5.3.0
INCLUDES += -I ../../ln882h_os/ln882h/mcu/driver_ln882h
INCLUDES += -I ../../ln882h_os/ln882h/mcu/driver_ln882h/hal
INCLUDES += -I ../../ln882h_os/ln882h/mcu/driver_ln882h/reg
INCLUDES += -I ../../ln882h_os/ln882h/mcu/ln882h


# vim:ft=make
#


