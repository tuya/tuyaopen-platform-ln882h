#ifndef _PROJ_CONFIG_H_
#define _PROJ_CONFIG_H_

#define DISABLE                                 (0)
#define ENABLE                                  (1)

/*
 * Clock settings section
 * Note:
 *
 */
#define XTAL_CLOCK                              (40000000)
#define RCO_CLOCK                               (32000)
#define PLL_CLOCK                               (160000000)

/*
 * Module enable/disable control
 */
#define FLASH_XIP                             DISABLE
#define LN_ASSERT_EN                          DISABLE
#define HAL_ASSERT_EN                         DISABLE
#define PRINTF_OMIT                           DISABLE // when release software, set 1 to omit all printf logs


/*
 * flash image settings
 */
#define FLASH_IMAGE_VER_MAJOR       0
#define FLASH_IMAGE_VER_MINOR       1
#define SOC_CRP_FLAG                0

/*
 * Hardware config
 */
#define CFG_UART0_TX_BUF_SIZE      128
#define CFG_UART0_RX_BUF_SIZE      128
#define CFG_UART1_TX_BUF_SIZE      128
#define CFG_UART1_RX_BUF_SIZE      128
#define CFG_UART2_TX_BUF_SIZE      128
#define CFG_UART2_RX_BUF_SIZE      128

#define CFG_UART_BAUDRATE_LOG      921600
#define CFG_UART_BAUDRATE_CONSOLE  115200


#endif /* _PROJ_CONFIG_H_ */

