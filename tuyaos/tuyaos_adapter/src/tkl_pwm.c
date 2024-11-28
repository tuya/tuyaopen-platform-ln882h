/**
 * @file tkl_pwm.c
 * @brief this file was auto-generated by tuyaos v&v tools, developer can add implements between BEGIN and END
 * 
 * @warning: changes between user 'BEGIN' and 'END' will be keeped when run tuyaos v&v tools
 *           changes in other place will be overwrited and lost
 *
 * @copyright Copyright 2020-2021 Tuya Inc. All Rights Reserved.
 * 
 */

// --- BEGIN: user defines and implements ---
#include "tkl_pwm.h"
#include "tuya_error_code.h"
#include "osal/osal.h"
#include "hal/hal_gpio.h"
#include "hal/hal_adv_timer.h"
#include "utils/debug/log.h"
// --- END: user defines and implements ---

typedef struct  {
    TUYA_PWM_NUM_E tuya_pwm_id;
    uint32_t tuya_pin;
    uint32_t ln_base;
    gpio_pin_t ln_pin;
    afio_function_t afio_fun;
    uint32_t adv_tim_x_base;
    uint8_t tim_clk_div_value; // timer div value
    TUYA_PWM_BASE_CFG_T tuya_pwm_info;
    volatile uint8_t change_flag;
    uint8_t init_flag;
    volatile uint8_t  update_flag;
    volatile uint32_t cmp_value;
}TUYA_LN_PWM_CNV_S;

enum Info_type {
    PWM_PIN,
    PWM_PIN_BASE,
    PWM_AFIO_FUNC,
    PWM_ADV_TIMER_BASE,
    PWM_ADV_TIMER_CLKDIV,
};

#define PWM_NUM    5
static TUYA_LN_PWM_CNV_S tuya_ln_pwm_map[PWM_NUM] = {
    {TUYA_PWM_NUM_0, 6, GPIOA_BASE, GPIO_PIN_11, ADV_TIMER_PWM0,  ADV_TIMER_0_BASE, 1, {TUYA_PWM_NEGATIVE, TUYA_PWM_CNT_UP, 0, 0}},//B
    {TUYA_PWM_NUM_1, 7, GPIOA_BASE, GPIO_PIN_10, ADV_TIMER_PWM2,  ADV_TIMER_1_BASE, 1, {TUYA_PWM_NEGATIVE, TUYA_PWM_CNT_UP, 0, 0}},//W
    {TUYA_PWM_NUM_2, 8, GPIOA_BASE, GPIO_PIN_7,  ADV_TIMER_PWM4,  ADV_TIMER_2_BASE, 1, {TUYA_PWM_NEGATIVE, TUYA_PWM_CNT_UP, 0, 0}},//C
    {TUYA_PWM_NUM_4, 24, GPIOB_BASE, GPIO_PIN_3,  ADV_TIMER_PWM8,  ADV_TIMER_4_BASE, 1, {TUYA_PWM_NEGATIVE, TUYA_PWM_CNT_UP, 0, 0}},//G
    {TUYA_PWM_NUM_5, 26, GPIOA_BASE, GPIO_PIN_12, ADV_TIMER_PWM10, ADV_TIMER_5_BASE, 1, {TUYA_PWM_NEGATIVE, TUYA_PWM_CNT_UP, 0, 0}},//R
};

static uint32_t __get_ln_info(TUYA_PWM_NUM_E n, enum Info_type type)
{
    uint32_t ret = 0;
    for (int i = 0; i < PWM_NUM; i++) {
        if (tuya_ln_pwm_map[i].tuya_pwm_id == n) {
            switch(type) {
                case PWM_PIN:
                    ret = tuya_ln_pwm_map[i].ln_pin;
                    break;
                case PWM_PIN_BASE:
                    ret = tuya_ln_pwm_map[i].ln_base;
                    break;
                case PWM_AFIO_FUNC:
                    ret = tuya_ln_pwm_map[i].afio_fun;
                    break;
                case PWM_ADV_TIMER_BASE:
                    ret = tuya_ln_pwm_map[i].adv_tim_x_base;
                    break;
                case PWM_ADV_TIMER_CLKDIV:
                    ret = tuya_ln_pwm_map[i].tim_clk_div_value;
                    break;
                default:
                    return 0;
            }
        }
    }
    return ret;
}

static int __get_index(TUYA_PWM_NUM_E n)
{
    uint32_t ret = 0;
    for (int i = 0; i < PWM_NUM; i++) {
        if (tuya_ln_pwm_map[i].tuya_pwm_id == n) {
            ret = i;
        }
    }
    return ret;
}

static int __tkl_pwm_check(TUYA_PWM_NUM_E n)
{
    for (int i = 0; i < PWM_NUM; i++) {
        if (tuya_ln_pwm_map[i].tuya_pwm_id == n) {
            return 1;
        }
    }
    return 0;
}

/**
 * @brief pwm init
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 * @param[in] cfg: pwm config
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_init(TUYA_PWM_NUM_E ch_id, const TUYA_PWM_BASE_CFG_T *cfg)
{
    OPERATE_RET op_ret = OPRT_OK;
    uint32_t apb0_clk = 0;
    uint8_t clk_div = 1; // adv timer clock division, default no division
    uint32_t load_value = 0;
    uint16_t cmp_value = 0;


    if (!__tkl_pwm_check(ch_id) || NULL == cfg) {
        LOG(LOG_LVL_ERROR, "tkl pwm init error, port %d, cfg: %x\r\n", ch_id, cfg);
        return OPRT_INVALID_PARM;
    }

    uint32_t timer_base = __get_ln_info(ch_id, PWM_ADV_TIMER_BASE);

    //LOG(LOG_LVL_INFO, "tkl pwm init, port: %d, f: %d, d: %d, p: %d, %x\r\n",
            //npwm, cfg->frequency, cfg->duty, cfg->polarity, timer_base);

    /* pwm gpio init */
    hal_gpio_pin_afio_select(
            __get_ln_info(ch_id, PWM_PIN_BASE),
            __get_ln_info(ch_id, PWM_PIN),
            __get_ln_info(ch_id, PWM_AFIO_FUNC));
    hal_gpio_pin_afio_en(
            __get_ln_info(ch_id, PWM_PIN_BASE),
            __get_ln_info(ch_id, PWM_PIN),
            HAL_ENABLE);

    /* Calculate adv-timer load value */
    clk_div    = __get_ln_info(ch_id, PWM_ADV_TIMER_CLKDIV);
    apb0_clk   = hal_clock_get_apb0_clk();
    load_value = apb0_clk/clk_div/cfg->frequency;
    /* pwm duty */
    cmp_value = (uint16_t)((load_value*1.0)*(cfg->duty*1.0/10000.0));

    if(cmp_value != 0)
        cmp_value = cmp_value - 1;
    // LOG(LOG_LVL_INFO, "apb0_clk:%d, div:%d, load_value:%d, cmp_value:%d\r\n", apb0_clk, clk_div, load_value, cmp_value);

    /* pwm adv-timer init config */
    adv_tim_init_t_def adv_timer_cfg = {0};
    memset(&adv_timer_cfg, 0, sizeof(adv_tim_init_t_def));

    /* set pwm frequency */
    adv_timer_cfg.adv_tim_clk_div = clk_div - 1;
    adv_timer_cfg.adv_tim_load_value = load_value - 2;
    /* set pwm duty */
    adv_timer_cfg.adv_tim_cmp_a_value = cmp_value;
    adv_timer_cfg.adv_tim_dead_en = ADV_TIMER_DEAD_DIS;
    adv_timer_cfg.adv_tim_cnt_mode = ADV_TIMER_CNT_MODE_INC;
    //adv_timer_cfg.adv_tim_cha_en = ADV_TIMER_CHA_EN;
    adv_timer_cfg.adv_tim_cha_inv_en = ADV_TIMER_CHA_INV_EN;
    adv_timer_cfg.adv_tim_cha_it_mode = ADV_TIMER_CHA_IT_MODE_INC;

    /* pwm init */
    hal_adv_tim_init(timer_base, &adv_timer_cfg);
    hal_adv_tim_set_comp_a(timer_base, cmp_value);

    // hal_adv_tim_it_cfg(timer_base, ADV_TIMER_IT_FLAG_CMPA, HAL_ENABLE);
    //hal_adv_tim_it_cfg(timer_base, ADV_TIMER_IT_FLAG_LOAD, HAL_ENABLE);
    // if (0 == NVIC_GetActive(ADV_TIMER_IRQn)) {
    //     NVIC_SetPriority(ADV_TIMER_IRQn, 4);
    //     NVIC_EnableIRQ(ADV_TIMER_IRQn);
    // }

    /* set pwm info */
    uint8_t index = __get_index(ch_id);
    tuya_ln_pwm_map[index].tuya_pwm_info.polarity  = cfg->polarity;
    tuya_ln_pwm_map[index].tuya_pwm_info.duty      = cfg->duty;
    tuya_ln_pwm_map[index].tuya_pwm_info.frequency = cfg->frequency;

    tuya_ln_pwm_map[index].init_flag   = 0;
    tuya_ln_pwm_map[index].update_flag = 0;
    tuya_ln_pwm_map[index].change_flag = 0;
    return op_ret;
}

/**
 * @brief pwm deinit
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_deinit(TUYA_PWM_NUM_E ch_id)
{
    if (!__tkl_pwm_check(ch_id)) {
        return OPRT_INVALID_PARM;
    }
    uint32_t timer_base = __get_ln_info(ch_id, PWM_ADV_TIMER_BASE);
    hal_adv_tim_cap_en(timer_base, HAL_DISABLE);
    hal_adv_tim_tim_en(timer_base, HAL_DISABLE);
    hal_adv_tim_dead_gap_en(timer_base, HAL_DISABLE);
    hal_adv_tim_a_en(timer_base, HAL_DISABLE);
    //hal_adv_tim_b_en(timer_base, HAL_DISABLE);

    hal_gpio_pin_afio_en(
            __get_ln_info(ch_id, PWM_PIN_BASE),
            __get_ln_info(ch_id, PWM_PIN),
            HAL_DISABLE);

    return OPRT_OK;
}

/**
 * @brief pwm start
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_start(TUYA_PWM_NUM_E ch_id)
{
    if (!__tkl_pwm_check(ch_id)) {
        return OPRT_INVALID_PARM;
    }
    uint8_t index = __get_index(ch_id);
    // if(tuya_ln_pwm_map[index].init_flag == 1){
    //     if(tuya_ln_pwm_map[index].change_flag == 1){
    //         LOG(LOG_LVL_INFO, "PWM config not take effect!!!...........................................\r\n");
    //     }
    //     tuya_ln_pwm_map[index].change_flag = 1;
    //     return OPRT_OK;
    // }
    tuya_ln_pwm_map[index].init_flag   = 1;
    volatile uint32_t apb0_clk   = hal_clock_get_apb0_clk();
    volatile uint16_t clk_div    = __get_ln_info(ch_id, PWM_ADV_TIMER_CLKDIV);
    volatile uint16_t load_value = (uint16_t)(apb0_clk/clk_div/tuya_ln_pwm_map[index].tuya_pwm_info.frequency)-2;
    volatile uint16_t cmp_value  = (uint16_t)((load_value*1.0)*(tuya_ln_pwm_map[index].tuya_pwm_info.duty*1.0/10000.0));
    volatile uint32_t timer_base = __get_ln_info(ch_id, PWM_ADV_TIMER_BASE);
    volatile uint32_t gpio_base  = __get_ln_info(ch_id, PWM_PIN_BASE);
    volatile uint32_t gpio_pin   = __get_ln_info(ch_id, PWM_PIN);

    if(cmp_value != 0){
        cmp_value = cmp_value - 1; //cal pwm offset.
    }

    gpio_init_t_def gpio_init;
    memset(&gpio_init,0,sizeof(gpio_init));
    gpio_init.pin = gpio_pin;
    gpio_init.speed = GPIO_HIGH_SPEED;

    //hal_adv_tim_a_en(timer_base, HAL_DISABLE);
    if(hal_adv_tim_get_load_value(timer_base) != load_value){
        hal_adv_tim_a_en(timer_base, HAL_DISABLE);
        hal_adv_tim_set_load_value(timer_base, load_value);
    }
    if(tuya_ln_pwm_map[index].tuya_pwm_info.duty == 0 || tuya_ln_pwm_map[index].tuya_pwm_info.duty == 10000){
        gpio_init.dir = GPIO_OUTPUT;
        if(tuya_ln_pwm_map[index].tuya_pwm_info.duty == 0){
            if (TUYA_PWM_NEGATIVE == tuya_ln_pwm_map[index].tuya_pwm_info.polarity) {
                hal_gpio_pin_set(gpio_base,gpio_pin);
            }else{
                hal_gpio_pin_reset(gpio_base,gpio_pin);
            }
        }else if(tuya_ln_pwm_map[index].tuya_pwm_info.duty == 10000){
            if (TUYA_PWM_NEGATIVE == tuya_ln_pwm_map[index].tuya_pwm_info.polarity) {
                hal_gpio_pin_reset(gpio_base,gpio_pin);
            }else{
                hal_gpio_pin_set(gpio_base,gpio_pin);
            } 
        }
        hal_gpio_pin_afio_en(gpio_base,gpio_pin,HAL_DISABLE);
        hal_gpio_init(gpio_base,&gpio_init);
    }else{
        hal_gpio_pin_afio_en(gpio_base,gpio_pin,HAL_ENABLE);
        gpio_init.dir = GPIO_INPUT;
        hal_gpio_init(gpio_base,&gpio_init);

        if (TUYA_PWM_NEGATIVE == tuya_ln_pwm_map[index].tuya_pwm_info.polarity) {
            hal_adv_tim_set_inv_a(timer_base, ADV_TIMER_CHA_INV_DIS);
        } else {
            hal_adv_tim_set_inv_a(timer_base, ADV_TIMER_CHA_INV_EN);
        }

        GLOBAL_INT_STOP();
        tuya_ln_pwm_map[index].cmp_value          = cmp_value;
        tuya_ln_pwm_map[index].update_flag        = 1;
        hal_adv_tim_it_cfg(timer_base, ADV_TIMER_IT_FLAG_LOAD, HAL_ENABLE);
        GLOBAL_INT_START();
    }

    //hal_adv_tim_set_load_value(timer_base, load_value);
    //hal_adv_tim_set_comp_a(timer_base, cmp_value);
    hal_adv_tim_a_en(timer_base, HAL_ENABLE);

    

    //LOG(LOG_LVL_INFO, "tkl pwm set reg:num: %d, d: %d, comp_a: %d,%d load: %d,%d\r\n",
            //npwm, tuya_ln_pwm_map[index].tuya_pwm_info.duty,hal_adv_tim_get_comp_a(timer_base),cmp_value,hal_adv_tim_get_load_value(timer_base),load_value);

    // hal_adv_tim_it_cfg(timer_base, ADV_TIMER_IT_FLAG_CMPA, HAL_ENABLE);
    // hal_adv_tim_it_cfg(timer_base, ADV_TIMER_IT_FLAG_LOAD, HAL_ENABLE);

    // if (0 == NVIC_GetActive(ADV_TIMER_IRQn)) {
    //     NVIC_SetPriority(ADV_TIMER_IRQn, 4);
    //     NVIC_EnableIRQ(ADV_TIMER_IRQn);
    // }
    NVIC_EnableIRQ(ADV_TIMER_IRQn);
    return OPRT_OK;
}

/**
 * @brief pwm stop
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_stop(TUYA_PWM_NUM_E ch_id)
{
    if (!__tkl_pwm_check(ch_id)) {
        return OPRT_INVALID_PARM;
    }

    uint32_t timer_base = __get_ln_info(ch_id, PWM_ADV_TIMER_BASE);
    hal_adv_tim_a_en(timer_base, HAL_DISABLE);
    hal_adv_tim_it_cfg(timer_base, ADV_TIMER_IT_FLAG_CMPA, HAL_DISABLE);
    hal_adv_tim_it_cfg(timer_base, ADV_TIMER_IT_FLAG_LOAD, HAL_DISABLE);

    return OPRT_OK;
}

/**
 * @brief multiple pwm channel start
 *
 * @param[in] ch_id: pwm channal id list
 * @param[in] num  : num of pwm channal to start
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_multichannel_start(TUYA_PWM_NUM_E *ch_id, uint8_t num)
{
    OPERATE_RET ret = 0;
    for(int i = 0; i < num; i ++){
        ret = tkl_pwm_start(ch_id[i]);
        if(ret != OPRT_OK){
            LOG(LOG_LVL_INFO, "tkl pwm %d init fail.\r\n",ch_id[i]);
        }
    }
    return OPRT_OK;
}

/**
 * @brief multiple pwm channel stop
 *
 * @param[in] ch_id: pwm channal id list
 * @param[in] num  : num of pwm channal to stop
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_multichannel_stop(TUYA_PWM_NUM_E *ch_id, uint8_t num)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief pwm duty set
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 * @param[in] duty:  pwm duty cycle
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_duty_set(TUYA_PWM_NUM_E ch_id, uint32_t duty)
{
    uint16_t cmp_value = 0;

    if (!__tkl_pwm_check(ch_id) || duty>10000) {
        return OPRT_INVALID_PARM;
    }
    uint32_t timer_base = __get_ln_info(ch_id, PWM_ADV_TIMER_BASE);
    uint8_t index = __get_index(ch_id);
    
    cmp_value = (uint16_t)((hal_adv_tim_get_load_value(timer_base)*1.0)*(duty*1.0/10000.0));

    if(cmp_value != 0){
        cmp_value = cmp_value - 1; //cal pwm offset.
    }

    //hal_adv_tim_set_comp_a(timer_base, cmp_value);

    tuya_ln_pwm_map[index].tuya_pwm_info.duty = duty;
    tuya_ln_pwm_map[index].cmp_value          = cmp_value;
    tuya_ln_pwm_map[index].update_flag        = 1;

    hal_adv_tim_it_cfg(timer_base, ADV_TIMER_IT_FLAG_LOAD, HAL_ENABLE);

    //LOG(LOG_LVL_INFO, "tkl pwm set duty: %d, d: %d, comp_a: %d, load: %d\r\n",
           //npwm, duty,hal_adv_tim_get_comp_a(timer_base),hal_adv_tim_get_load_value(timer_base));

    return OPRT_OK;
}

/**
 * @brief pwm frequency set
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 * @param[in] frequency: pwm frequency
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_frequency_set(TUYA_PWM_NUM_E ch_id, uint32_t frequency)
{
    uint32_t apb0_clk = 0;
    uint16_t load_value = 0;
    uint8_t clk_div = 1;

    if (!__tkl_pwm_check(ch_id)) {
        return OPRT_INVALID_PARM;
    }
    uint8_t index = __get_index(ch_id);

    apb0_clk = hal_clock_get_apb0_clk();
    clk_div = __get_ln_info(ch_id, PWM_ADV_TIMER_CLKDIV);
    load_value = (uint16_t)(apb0_clk/clk_div/frequency)-1;

    uint32_t timer_base = __get_ln_info(ch_id, PWM_ADV_TIMER_BASE);

    /* set pwm duty, frequency */
    hal_adv_tim_a_en(timer_base, HAL_DISABLE);
    tkl_pwm_duty_set(ch_id, tuya_ln_pwm_map[index].tuya_pwm_info.duty);
    hal_adv_tim_set_load_value(timer_base, load_value);
    hal_adv_tim_a_en(timer_base, HAL_ENABLE);

    tuya_ln_pwm_map[index].tuya_pwm_info.frequency = frequency;

    return OPRT_OK;
}

/**
 * @brief pwm polarity set
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 * @param[in] polarity: pwm polarity
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_polarity_set(TUYA_PWM_NUM_E ch_id, TUYA_PWM_POLARITY_E polarity)
{
    if (!__tkl_pwm_check(ch_id)) {
        return OPRT_INVALID_PARM;
    }
    uint8_t index = __get_index(ch_id);
    uint32_t timer_base = __get_ln_info(ch_id, PWM_ADV_TIMER_BASE);
    /* set pwm polarity */
    if (TUYA_PWM_NEGATIVE == polarity) {
        hal_adv_tim_set_inv_a(timer_base, ADV_TIMER_CHA_INV_DIS);
    } else {
        hal_adv_tim_set_inv_a(timer_base, ADV_TIMER_CHA_INV_EN);
    }

    tuya_ln_pwm_map[index].tuya_pwm_info.polarity = polarity;

    return OPRT_OK;
}

/**
 * @brief set pwm info
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 * @param[in] info: pwm info
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_info_set(TUYA_PWM_NUM_E ch_id, const TUYA_PWM_BASE_CFG_T *info)
{
    if (!__tkl_pwm_check(ch_id) || NULL==info) {
        return OPRT_INVALID_PARM;
    }
    uint8_t index = __get_index(ch_id);

    tuya_ln_pwm_map[index].tuya_pwm_info.duty      = info->duty;
    tuya_ln_pwm_map[index].tuya_pwm_info.frequency = info->frequency;
    tuya_ln_pwm_map[index].tuya_pwm_info.polarity  = info->polarity;

    //LOG(LOG_LVL_INFO, "tkl pwm set info: %d, f: %d, d: %d, p: %d\r\n",
            //npwm, info->frequency, info->duty, info->polarity);

    return OPRT_OK;
}

/**
 * @brief get pwm info
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 * @param[out] info: pwm info
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_info_get(TUYA_PWM_NUM_E ch_id, TUYA_PWM_BASE_CFG_T *info)
{
    if (!__tkl_pwm_check(ch_id) || NULL==info) {
        return OPRT_INVALID_PARM;
    }
    uint8_t index = __get_index(ch_id);

    info->polarity = tuya_ln_pwm_map[index].tuya_pwm_info.polarity;
    info->duty = tuya_ln_pwm_map[index].tuya_pwm_info.duty;
    info->frequency = tuya_ln_pwm_map[index].tuya_pwm_info.frequency;

    return OPRT_OK;
}

int32_t tkl_pwm_io_pin_to_port(uint32_t pin)
{
    for (int i = 0; i < sizeof(tuya_ln_pwm_map)/sizeof(tuya_ln_pwm_map[0]); i++) {
        if (pin == tuya_ln_pwm_map[i].tuya_pin)
            return tuya_ln_pwm_map[i].tuya_pwm_id;
    }

    return -1;
}

/**
 * @brief pwm capture mode start
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 * @param[in] cfg: pwm capture irq config
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_cap_start(TUYA_PWM_NUM_E ch_id, const TUYA_PWM_CAP_IRQ_T *cfg)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief pwm capture mode stop
 *
 * @param[in] ch_id: pwm channal id, id index starts at 0
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_pwm_cap_stop(TUYA_PWM_NUM_E ch_id)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

volatile uint8_t  int_cnt   = 0;
volatile uint8_t  int_index = 0;
void ADV_TIMER_IRQHandler()
{
    for (int_cnt = 0; int_cnt < PWM_NUM; int_cnt++) {
        if(tuya_ln_pwm_map[int_cnt].update_flag == 1){
            if(hal_adv_tim_get_it_flag(tuya_ln_pwm_map[int_cnt].adv_tim_x_base, ADV_TIMER_IT_FLAG_LOAD) == HAL_SET){
                hal_adv_tim_clr_it_flag(tuya_ln_pwm_map[int_cnt].adv_tim_x_base, ADV_TIMER_IT_FLAG_LOAD);
                hal_adv_tim_it_cfg(tuya_ln_pwm_map[int_cnt].adv_tim_x_base,ADV_TIMER_IT_FLAG_LOAD,HAL_DISABLE);
                hal_adv_tim_set_comp_a(tuya_ln_pwm_map[int_cnt].adv_tim_x_base,tuya_ln_pwm_map[int_cnt].cmp_value);
                tuya_ln_pwm_map[int_cnt].update_flag = 0;
            }
        }
    }
}
