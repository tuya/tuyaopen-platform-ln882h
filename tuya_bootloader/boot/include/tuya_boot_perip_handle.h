/****************************************************************************
 * @file tuya_boot_perip_handle.h
 * @brief header file of tuya_boot_perip_handle
 * @version <0.0.1>
 * @date 2022-06-24
 *
 * @copyright Copyright(C) 2021-2022 Tuya Inc. All Rights Reserved.
 ****************************************************************************/

#ifndef __TUYA_BOOT_PERIP_HANDLE_H__
#define __TUYA_BOOT_PERIP_HANDLE_H__


/****************************************************************************
 * Included Files
 ****************************************************************************/


/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/


/****************************************************************************
 * Public Type Declarations
 ****************************************************************************/
#pragma pack(push)
#pragma pack(4)

/* PWM */
enum pwm_mode {
    PWM_MODE_NORMAL = 0,
    PWM_MODE_MUTEX
};

struct pwm_normal {
    uint8_t io;
    uint8_t duty;
    uint32_t freq;
};

struct pwm_mutex {
    uint8_t  io1;
    uint8_t  io2;

    uint8_t  duty1;
    uint8_t  duty2;
    uint32_t freq;
    uint32_t dead_band;
};

struct pwm_ongoing {
    enum pwm_mode mode;
    union {
        struct pwm_normal normal;
        struct pwm_mutex mut;
    };
};

/* GPIO */
enum gpio_output_mode {
    BL_GPIO_OUTPUT,
    BL_GPIO_OUTPUT_PP,
    BL_GPIO_OUTPUT_OD,
};

/* Should be output mode */
struct gpio_ongoing {
    uint8_t io;
    uint8_t level;
    uint8_t output_mode;    /* @ref: enum gpio_output_mode */
    uint8_t padding;
};


struct perip_header {
    uint32_t magic;         /* Magic: "TYBL" */
    uint32_t pwm_data_len;
    uint32_t gpio_data_len;
};

#pragma pack(pop)


/****************************************************************************
 * Public Data
 ****************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

int bl_peripheral_status_keep(uint32_t address);

void bl_peripheral_remove(void);

#ifdef __cplusplus
}
#endif

#endif /* !__TUYA_BOOT_PERIP_HANDLE_H__ */
