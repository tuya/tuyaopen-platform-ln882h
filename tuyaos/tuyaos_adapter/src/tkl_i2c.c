/**
 * @file tkl_i2c.c
 * @brief this file was auto-generated by tuyaos v&v tools, developer can add implements between BEGIN and END
 * 
 * @warning: changes between user 'BEGIN' and 'END' will be keeped when run tuyaos v&v tools
 *           changes in other place will be overwrited and lost
 *
 * @copyright Copyright 2020-2021 Tuya Inc. All Rights Reserved.
 * 
 */

// --- BEGIN: user defines and implements ---
#include "tkl_i2c.h"
#include "tuya_error_code.h"
#include "osal/osal.h"
#include "hal/hal_gpio.h"
#include "hal/hal_i2c.h"
// --- END: user defines and implements ---

#define I2C_NUM_MAX     1

typedef struct  {
    uint32_t scl_base;
    gpio_pin_t scl_pin;
    uint32_t sda_base;
    gpio_pin_t sda_pin;
}I2C_IO_CFG_S;

#define I2C_TIMEOUT 0xFFFF

static I2C_IO_CFG_S i2c_io_cfg = {
    .scl_base = GPIOB_BASE,
    .scl_pin = GPIO_PIN_6,
    .sda_base = GPIOB_BASE,
    .sda_pin = GPIO_PIN_7,
};

static volatile uint8_t __I2C_STOP_FLAG = 1;

OPERATE_RET tkl_i2c_init(TUYA_I2C_NUM_E port, const TUYA_IIC_BASE_CFG_T *cfg)
{
    if (I2C_NUM_MAX <= port || NULL== cfg) {
        return OPRT_INVALID_PARM;
    }

    if (TUYA_IIC_MODE_SLAVE == cfg->role) {
        return OPRT_NOT_SUPPORTED;
    }

    /* i2c gpio init */
    hal_gpio_pin_afio_en(i2c_io_cfg.scl_base, i2c_io_cfg.scl_pin, HAL_DISABLE);
    hal_gpio_pin_afio_en(i2c_io_cfg.sda_base, i2c_io_cfg.sda_pin, HAL_DISABLE);
    hal_gpio_pin_afio_select(i2c_io_cfg.scl_base, i2c_io_cfg.scl_pin, I2C0_SCL);
    hal_gpio_pin_afio_select(i2c_io_cfg.sda_base, i2c_io_cfg.sda_pin, I2C0_SDA);
    hal_gpio_pin_afio_en(i2c_io_cfg.scl_base, i2c_io_cfg.scl_pin, HAL_ENABLE);
    hal_gpio_pin_afio_en(i2c_io_cfg.sda_base, i2c_io_cfg.sda_pin, HAL_ENABLE);

    hal_i2c_en(I2C_BASE, HAL_DISABLE);

    i2c_init_t_def i2c_init;
    memset(&i2c_init, 0, sizeof(i2c_init));

    if (TUYA_IIC_ADDRESS_10BIT == cfg->addr_width) {
        i2c_init.i2c_add_mode = I2C_ADD_7BIT_MODE;
        LOG(LOG_LVL_INFO, "7BIT\r\n");
    } else {
        i2c_init.i2c_add_mode = I2C_ADD_10BIT_MODE;
    }

    if (TUYA_IIC_BUS_SPEED_100K == cfg->speed) {
        i2c_init.i2c_peripheral_clock_freq = 4;
        i2c_init.i2c_master_mode_sel = I2C_FM_MODE;
        i2c_init.i2c_fm_mode_duty_cycle = I2C_FM_MODE_DUTY_CYCLE_2;
        i2c_init.i2c_ccr = 16;
    } else if (TUYA_IIC_BUS_SPEED_400K == cfg->speed) {
        i2c_init.i2c_peripheral_clock_freq = 4;
        i2c_init.i2c_master_mode_sel = I2C_FM_MODE;
        i2c_init.i2c_fm_mode_duty_cycle = I2C_FM_MODE_DUTY_CYCLE_2;
        i2c_init.i2c_ccr = 4;
    } else {
        return OPRT_NOT_SUPPORTED;
    }

    i2c_init.i2c_trise = 0xF;
    i2c_init.i2c_mode = I2C_I2C_MODE;

    hal_i2c_init(I2C_BASE, &i2c_init);
    hal_i2c_en(I2C_BASE, HAL_ENABLE);
    __I2C_STOP_FLAG=1;

    return OPRT_OK;
}

/**
 * @brief i2c deinit
 *
 * @param[in] port: i2c port
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_deinit(TUYA_I2C_NUM_E port)
{
    if (I2C_NUM_MAX<=port) {
        return OPRT_INVALID_PARM;
    }

    /* gpio  deinit */
    hal_gpio_pin_afio_en(i2c_io_cfg.scl_base, i2c_io_cfg.scl_pin, HAL_DISABLE);
    hal_gpio_pin_afio_en(i2c_io_cfg.sda_base, i2c_io_cfg.sda_pin, HAL_DISABLE);

    hal_i2c_deinit();

    return OPRT_OK;
}

/**
 * @brief i2c irq init
 * NOTE: call this API will not enable interrupt
 *
 * @param[in] port: i2c port, id index starts at 0
 * @param[in] cb:  i2c irq cb
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_irq_init(TUYA_I2C_NUM_E port, TUYA_I2C_IRQ_CB cb)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief i2c irq enable
 *
 * @param[in] port: i2c port id, id index starts at 0
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_irq_enable(TUYA_I2C_NUM_E port)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief i2c irq disable
 *
 * @param[in] port: i2c port id, id index starts at 0
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_irq_disable(TUYA_I2C_NUM_E port)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief i2c master send
 *
 * @param[in] port: i2c port
 * @param[in] dev_addr: iic addrress of slave device.
 * @param[in] data: i2c data to send
 * @param[in] size: Number of data items to send
 * @param[in] xfer_pending: xfer_pending: TRUE : not send stop condition, FALSE : send stop condition.
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_master_send(TUYA_I2C_NUM_E port, uint16_t dev_addr, const void *data, uint32_t size,
                                BOOL_T xfer_pending)
{
    uint32_t send_count = 0;
    uint8_t* send_data = (uint8_t*)data;
    uint32_t len = size/sizeof(uint8_t);

    if (I2C_NUM_MAX<=port || NULL==data) {
        return OPRT_INVALID_PARM;
    }

    if (hal_i2c_wait_bus_idle(I2C_BASE, 0x10) == HAL_RESET) {
        hal_i2c_master_reset(I2C_BASE);
    }
    /* 2. send start signal */
    if (hal_i2c_master_start(I2C_BASE, I2C_TIMEOUT) == HAL_RESET) {
        return OPRT_OS_ADAPTER_I2C_TIMEOUT;
    }
    /* 3. send addr */
    hal_i2c_master_send_data(I2C_BASE, dev_addr);
    /* 4. wait send complete */
    if (hal_i2c_master_wait_addr(I2C_BASE, I2C_TIMEOUT) == HAL_RESET) {
        return OPRT_OS_ADAPTER_I2C_TIMEOUT;
    }
    /* 5. clear addr flag */
    hal_i2c_clear_sr(I2C_BASE);
    /* 6. send data */
    for (send_count=0; send_count<len; send_count++) {
        /* wait tx empty flag */
        if (hal_i2c_wait_txe(I2C_BASE, I2C_TIMEOUT) == HAL_RESET) {
            return OPRT_OS_ADAPTER_I2C_TRANS_ERR;
        } else {
            hal_i2c_master_send_data(I2C_BASE, send_data[send_count]);
        }
    }
    /* 7. wait send complete */
    if (hal_i2c_wait_btf(I2C_BASE, I2C_TIMEOUT) == HAL_RESET) {
        return OPRT_OS_ADAPTER_I2C_TRANS_ERR;
    }
    /* 8. send stop signal */
    if (FALSE == xfer_pending) {
        hal_i2c_master_stop(I2C_BASE);
    }

    return OPRT_OK;
}

/**
 * @brief i2c master recv
 *
 * @param[in] port: i2c port
 * @param[in] dev_addr: iic addrress of slave device.
 * @param[in] data: i2c buf to recv
 * @param[in] size: Number of data items to receive
 * @param[in] xfer_pending: TRUE : not send stop condition, FALSE : send stop condition.
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_master_receive(TUYA_I2C_NUM_E port, uint16_t dev_addr, void *data, uint32_t size,
                                   BOOL_T xfer_pending)
{
    uint32_t recv_count = 0;
    uint8_t* recv_data = (uint8_t*)data;
    uint32_t len = size/sizeof(uint8_t);

    if (I2C_NUM_MAX<=port || NULL==data) {
        return OPRT_INVALID_PARM;
    }

    if (hal_i2c_wait_bus_idle(I2C_BASE, 0x10) == HAL_RESET) {
        hal_i2c_master_reset(I2C_BASE);
    }
    /* 2. send start signal */
    if (hal_i2c_master_start(I2C_BASE, I2C_TIMEOUT) == HAL_RESET) {
        LOG(LOG_LVL_INFO, "start error\r\n");
        return OPRT_OS_ADAPTER_I2C_TIMEOUT;
    }
    /* 3. send addr */
    hal_i2c_master_send_data(I2C_BASE, dev_addr);
    /* 4. wait send complete */
    if (hal_i2c_master_wait_addr(I2C_BASE, I2C_TIMEOUT) == HAL_RESET) {
        return OPRT_OS_ADAPTER_I2C_TIMEOUT;
    }
    /* 5. clear addr flag */
    hal_i2c_clear_sr(I2C_BASE);
    /* 6. receive data */
    hal_i2c_ack_en(I2C_BASE, HAL_ENABLE);
    for (recv_count=0; recv_count<len; recv_count++) {
        if (recv_count == len-1) {
            /* last data, don't send ack */
            hal_i2c_ack_en(I2C_BASE, HAL_DISABLE);
        }
        if (hal_i2c_wait_rxne(I2C_BASE, I2C_TIMEOUT) == HAL_RESET) {
            return OPRT_OS_ADAPTER_I2C_TIMEOUT;
        }
        recv_data[recv_count] = hal_i2c_master_recv_data(I2C_BASE);
    }

    if (FALSE == xfer_pending) {
        hal_i2c_master_stop(I2C_BASE);
    }

    return OPRT_OK;
}

/**
 * @brief i2c slave
 *
 * @param[in] port: i2c port
 * @param[in] dev_addr: slave device addr
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_set_slave_addr(TUYA_I2C_NUM_E port, uint16_t dev_addr)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief i2c slave send
 *
 * @param[in] port: i2c port
 * @param[in] data: i2c buf to send
 * @param[in] size: Number of data items to send
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */

OPERATE_RET tkl_i2c_slave_send(TUYA_I2C_NUM_E port, const void *data, uint32_t size)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief IIC slave receive, Start receiving data as IIC Slave.
 *
 * @param[in] port: i2c port
 * @param[in] data: Pointer to buffer for data to receive from IIC Master
 * @param[in] size: Number of data items to receive
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */

OPERATE_RET tkl_i2c_slave_receive(TUYA_I2C_NUM_E port, void *data, uint32_t size)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief IIC get status.
 *
 * @param[in] port: i2c port
 * @param[out]  TUYA_IIC_STATUS_T
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_get_status(TUYA_I2C_NUM_E port, TUYA_IIC_STATUS_T *status)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}

/**
 * @brief i2c's reset
 *
 * @param[in] port: i2c port number
 *
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_reset(TUYA_I2C_NUM_E port)
{
    hal_i2c_master_reset(I2C_BASE);
    return OPRT_OK;
}

/**
 * @brief i2c transferred data count.
 *
 * @param[in] port: i2c port id, id index starts at 0
 *
 * @return >=0,number of currently transferred data items. <0,err.
 * tkl_i2c_master_send:number of data bytes transmitted and acknowledged
 * tkl_i2c_master_receive:number of data bytes received
 * tkl_i2c_slave_send:number of data bytes transmitted
 * tkl_i2c_slave_receive:number of data bytes received and acknowledged
 */
int32_t tkl_i2c_get_data_count(TUYA_I2C_NUM_E port)
{
    // --- BEGIN: user implements ---
    return 0;
    // --- END: user implements ---
}

/**
 * @brief i2c ioctl
 *
 * @param[in]       cmd     user def
 * @param[in]       args    args associated with the command
 * @return OPRT_OK on success. Others on error, please refer to tuya_error_code.h
 */
OPERATE_RET tkl_i2c_ioctl(TUYA_I2C_NUM_E port, uint32_t cmd, void *args)
{
    // --- BEGIN: user implements ---
    return OPRT_NOT_SUPPORTED;
    // --- END: user implements ---
}
