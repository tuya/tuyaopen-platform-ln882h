/****************************************************************************
 * @file port_platform_init.c
 * @brief this module is used to port_platform_init
 * @version 0.0.1
 * @date 2022-05-16
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/


#include <stdio.h>
#include <stdarg.h>
#include "tuya_boot.h"
#include "port.h"
#include "tuya_boot_perip_handle.h"

#include "ln882h.h"
#include "base_addr_ln882h.h"
#include "hal/hal_gpio.h"
#include "hal/hal_common.h"
#include "hal/hal_misc.h"
#include "hal/hal_cache.h"
#include "hal/hal_flash.h"
#include "hal/hal_uart.h"
#include "utils/wrap_stdio.h"
#include "utils/reboot_trace/reboot_trace.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Private Type Declarations
 ****************************************************************************/

/****************************************************************************
 * Private Data Declarations
 ****************************************************************************/
#pragma pack(push, 4)
typedef struct {
    uint8_t     * bootram_target_addr; // bootram load addr
    uint16_t      bootram_bin_length;  // Tools build
    uint16_t      bootram_crc_offset;  // >= (sizeof(boot_header_t) + sizeof(boot_header_ext_t))
    uint32_t      bootram_crc_value;   // Tools build (Depends on the bootram_crc_offset.)
    uint32_t    * bootram_vector_addr; // bootram vector addr (At least 256 Byte aligned.)
    uint32_t      crp_flag;            // Tools build
    uint32_t      boot_hearder_crc;    // Tools build
} boot_header_t;

typedef struct {
    struct
    {
        uint32_t ver0 : 8;
        uint32_t ver1 : 8;
        uint32_t ver2 : 8;
        uint32_t ver3 : 8;
    } boot_version;

    uint32_t res1;
} header_ext_t;

typedef struct {
    boot_header_t boot_header;
    header_ext_t  ext_data;
}bootram_info_t;
#pragma pack(pop)


#define BOOT_HEADER_ATTRIBUTE   __attribute__((used, section(".boot_header")))
#define TO_BE_FILLED           (0xFFFFFFFF)
#define FLASH_VALID_FLAG       (0x32545241)
#define CRP_VALID_FLAG         (0x46505243)

const bootram_info_t boot_info BOOT_HEADER_ATTRIBUTE = {
    .boot_header ={
        .bootram_target_addr  = (uint8_t *)BOOTRAM_BASE,
        .bootram_bin_length   = 0xffff,
        .bootram_crc_offset   = sizeof(boot_header_t) + sizeof(header_ext_t),
        .bootram_crc_value    = TO_BE_FILLED,
        .bootram_vector_addr  = (uint32_t *)(BOOTRAM_BASE + 0x100),    //At least 256 bytes aligned.
        .crp_flag             = CRP_VALID_FLAG,
        .boot_hearder_crc     = TO_BE_FILLED
    },

    .ext_data = {
        .boot_version.ver0 = 1,
        .boot_version.ver1 = 0,
        .boot_version.ver2 = 0,
        .boot_version.ver3 = 0,
        .res1 = 0,
    },
};

/****************************************************************************
 * Private Functions
 ****************************************************************************/

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/
#ifdef CONFIG_ENABLE_DEBUG
typedef struct
{
    uint32_t     uart_base;
    uart_init_t_def  init_cfg;
} uart_dev_t;
static uart_dev_t g_uart0;

#define LOG_BUF_SIZE    100
static char log_buf[LOG_BUF_SIZE];

static void uart0_io_pin_request(void)
{
    //hal_gpio_pin_afio_select(GPIOB_BASE,GPIO_PIN_8,UART0_RX);
    hal_gpio_pin_afio_select(GPIOB_BASE,GPIO_PIN_9,UART0_TX);
    //hal_gpio_pin_afio_en(GPIOB_BASE,GPIO_PIN_8,HAL_ENABLE);
    hal_gpio_pin_afio_en(GPIOB_BASE,GPIO_PIN_9,HAL_ENABLE);
}

static void uart0_io_pin_release(void)
{
    hal_gpio_pin_afio_en(GPIOB_BASE, GPIO_PIN_8, HAL_DISABLE);
    hal_gpio_pin_afio_en(GPIOB_BASE, GPIO_PIN_9, HAL_DISABLE);
}

static void hw_uart0_init(uint32_t baudrate)
{
    g_uart0.uart_base          = UART0_BASE;
    g_uart0.init_cfg.baudrate  = baudrate;//115200 921600 2000000
    g_uart0.init_cfg.word_len  = UART_WORD_LEN_8;
    g_uart0.init_cfg.parity    = UART_PARITY_NONE;
    g_uart0.init_cfg.stop_bits = UART_STOP_BITS_1;

    hal_uart_init(g_uart0.uart_base, &g_uart0.init_cfg);

    //hal_uart_rx_mode_en(UART0_BASE, HAL_ENABLE);
    hal_uart_tx_mode_en(UART0_BASE, HAL_ENABLE);
    hal_uart_en(UART0_BASE, HAL_ENABLE);

    uart0_io_pin_request();
}

void port_log_init(void)
{
    hw_uart0_init(921600);
}

void port_log_deinit(void)
{
    hal_misc_reset_uart0();
    NVIC_ClearPendingIRQ(UART0_IRQn);
    NVIC_DisableIRQ(UART0_IRQn);

    uart0_io_pin_release();
}

void port_bl_log(const char *fmt, ...)
{
    int len = 0, i = 0;
    va_list ap;

    memset(log_buf, 0, LOG_BUF_SIZE);

    va_start(ap, fmt);
    len = vsnprintf(log_buf, LOG_BUF_SIZE, fmt, ap);
    va_end(ap);

    if (len >= LOG_BUF_SIZE || len == 0)
        return;

    while(len != 0) {
        while (hal_uart_flag_get(UART0_BASE, USART_FLAG_TX_FIFO_FULL) == HAL_SET) {};
        hal_uart_send_data(UART0_BASE, log_buf[i++]);
        len--;
    }
}

#endif // CONFIG_ENABLE_DEBUG

/**
 * @brief platform init
 *
 * @param[in] void: buffer
 *
 */
__bl_weak_func void platform_init_hook(void)
{
    // clock init
    SetSysClock();

    // Remove uart pin initialization in the rom stage
    hal_gpio_pin_afio_en(GPIOA_BASE, GPIO_PIN_2, HAL_DISABLE);
    hal_gpio_pin_afio_en(GPIOA_BASE, GPIO_PIN_3, HAL_DISABLE);

    __NVIC_SetPriorityGrouping(4);
    NVIC_SetPriority(SysTick_IRQn,   1);
    NVIC_SetPriority(UART0_IRQn,     4);
    NVIC_SetPriority(UART1_IRQn,     4);

    __enable_irq();

    return;
}

static void __platform_handle_pwm(uint8_t pwm_num, struct pwm_ongoing *pwm)
{
    uint8_t i = 0;
    uint32_t pwm_period;

    for(i = 0; i < pwm_num; i++) {
        if(pwm[i].mode == PWM_MODE_MUTEX) {
//            pwm_period = (unsigned int) (26 * 1000000 / pwm[i].mut.freq);
//            bk_pwm_cw_initialize(bk_pwm_port_get(pwm[i].mut.io1), bk_pwm_port_get(pwm[i].mut.io2), pwm_period, \
//                pwm[i].mut.duty1 * pwm_period / 100, pwm[i].mut.duty2 * pwm_period / 100, pwm[i].mut.dead_band * pwm_period / 100);
//            bk_pwm_cw_start(bk_pwm_port_get(pwm[i].mut.io1), bk_pwm_port_get(pwm[i].mut.io2));
            continue;
        }

        if(pwm[i].mode == PWM_MODE_NORMAL) {
//            pwm_period = (unsigned int) (26 * 1000000 / pwm[i].normal.freq);
//            bk_pwm_initialize(bk_pwm_port_get(pwm[i].normal.io), pwm_period, pwm[i].normal.duty * pwm_period / 100, 0, 0);
//            bk_pwm_start(bk_pwm_port_get(pwm[i].normal.io));
        }
    }
}


static void __platform_handle_gpio(uint8_t gpio_num, struct gpio_ongoing *gpio)
{
    uint8_t i = 0;

    for(i = 0; i < gpio_num; i++) {
        if(gpio[i].output_mode == BL_GPIO_OUTPUT || gpio[i].output_mode == BL_GPIO_OUTPUT_PP || gpio[i].output_mode == BL_GPIO_OUTPUT_OD) {
//            BkGpioInitialize(gpio[i].io, OUTPUT_NORMAL);
//            bk_gpio_output(gpio[i].io, gpio[i].level);
        }
    }
}

/**
 * @brief platform handle somthing after startup
 *
 * @param[in] address: current program exec address
 *
 * @return 0 on success. Others on error, please refer to tuya_boot.h
 */
__bl_weak_func int platform_handle_after_startup(uint32_t address)
{
    unused_param(address);

    return 0;
}

/**
 * @brief keep peripheral status
 *
 * @param[in] address: peripheral status data stored address
 *
 */
__bl_weak_func void platform_perip_setup(struct perip_header *address)
{
    struct perip_header *p = address;

    uint8_t pwm_num = p->pwm_data_len / sizeof(struct pwm_ongoing);
    struct pwm_ongoing *pwm_base = (struct pwm_ongoing *)((uint8_t *)p + sizeof(struct perip_header));
    if(pwm_num != 0)
        __platform_handle_pwm(pwm_num, pwm_base);

    uint8_t gpio_num = p->gpio_data_len / sizeof(struct gpio_ongoing);
    struct gpio_ongoing *gpio_base = (struct gpio_ongoing *)((uint8_t *)p + sizeof(struct perip_header) + p->pwm_data_len);
    if(gpio_num != 0)
        __platform_handle_gpio(gpio_num, gpio_base);

    return;
}

__bl_weak_func void platform_perip_remove(struct perip_header *p)
{
    unused_param(p);
}

/**
 * @brief keep peripheral status
 *
 * @param[in] address: peripheral status data stored address
 *
 */
__bl_weak_func void platform_perip_handle_others(void)
{
    return;
}

/**
 * @brief check if program stored in ota partition
 *
 * @param[in] info: ota partition information
 * @param[out] address: ota program address
 *
 * @return 0 if need exec, others no exec.
 */
__bl_weak_func int platform_check_ota_program(struct ft_item_info *ota_info, \
        uint32_t *address)
{

    if (0xaeaebebe == hal_misc_awo_get_r_idle_reg()) {
        // 跳转执行ota区程序  TODO Header offset
        *address = ota_info->offset + sizeof(int);
        return 0;
    }

    return 1;
}

/**
 * @brief platform do something before ota
 *
 * @param[in] ota_result
 *
 */
__bl_weak_func void platform_handle_before_ota(void)
{
    return;
}

/**
 * @brief platform do something after ota
 *
 * @param[in] ota_result
 *
 */
__bl_weak_func void platform_handle_after_ota(int ota_result)
{
    unused_param(ota_result);
    return;
}

/**
 * @brief platform jump function
 *
 * @param[in] info: partiotion information
 * @param[in] address: the address where is program stored
 *
 */
typedef void (*jump_func_t)(uint32_t r0, uint32_t r1, uint32_t r2, uint32_t r3);
__bl_weak_func void platform_do_jump(uint32_t address)
{
    //Prepare for jump
    {
        port_log_deinit();                 //clear log uart isr
        hal_flash_quad_mode_enable(1);//Enable QSPI 4bit mode
        flash_cache_init(0);          //Init Flash cache
    }

    //Jump to user's Reset_Handler
    uint32_t *vec_int_base = (uint32_t *)(CACHE_FLASH_BASE + address);
    jump_func_t *jump_func = (jump_func_t *)(vec_int_base + 1);

    __set_MSP(*vec_int_base);
    (*jump_func)(CACHE_FLASH_BASE + address, 1, 2, 3);

    return;
}

/**
 * @brief platform reboot
 *
 */
__bl_weak_func void platform_system_reboot(void)
{
    ln_chip_reboot();
}








