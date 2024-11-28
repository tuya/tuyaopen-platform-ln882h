#ifndef __USR_APP_H__
#define __USR_APP_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>


#define LN_BLE_MAC_ADDR0    0x00
#define LN_BLE_MAC_ADDR1    0x50
#define LN_BLE_MAC_ADDR2    0xC2
#define LN_BLE_MAC_ADDR3    0x5E
#define LN_BLE_MAC_ADDR4    0x11
#define LN_BLE_MAC_ADDR5    0x22

void     ln_load_config_info (void);
uint8_t* ln_get_mac_array    (bool reverse);


void creat_usr_app_task(void);
uint32_t usr_reboot_cnt_get(void);
int usr_reboot_cause_get(void);

#ifdef __cplusplus
}
#endif

#endif /* __USR_APP_H__ */
