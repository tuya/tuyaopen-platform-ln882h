#include "proj_config.h"
#include "lwip/netif.h"
#include "lwip/tcpip.h"
#include "lwip/dhcp.h"
#include "lwip/netifapi.h"
#include "lwip/ethernetif.h"
#include "netif/etharp.h"
#include "dhcpd_api.h"
#include "wifi.h"
#include "utils/debug/log.h"
#include "ln_compiler.h"
#include "ln_utils.h"

#include "freertos_common.h"
#include "lwip/sockets.h"
#include "ln_netif/ln_ethernetif.h"


static netdev_get_ip_cb_t g_get_ip_cb  = NULL;

static struct netif *ethernetif_get_netdev(netif_idx_t nif_idx)
{
    TUYA_NETIF_TYPE idx;

    if (nif_idx == NETIF_IDX_STA) {
        idx = NETIF_STA_IDX;
    } else if (nif_idx == NETIF_IDX_AP) {
        idx = NETIF_AP_IDX;
    } else {
        return NULL;
    }

    return tuya_ethernetif_get_netif_by_index(idx);
}

struct netif *netdev_get_netif(netif_idx_t nif_idx)
{
    return ethernetif_get_netdev(nif_idx);
}

static void sta_netif_link_changed_cb(struct netif *nif)
{
    LN_UNUSED(nif);
    LOG(LOG_LVL_DEBUG, "[%s:%d]\r\n", __func__, __LINE__);
}

static void print_netdev_info(struct netif *nif)
{
    uint8_t * mac = nif->hwaddr;

    LOG(LOG_LVL_INFO, "+--------------- net device info ------------+\r\n");
    LOG(LOG_LVL_INFO, "|netif hostname: %-16s            |\r\n", nif->hostname);
    LOG(LOG_LVL_INFO, "|netif ip      = %-16s            |\r\n", ip4addr_ntoa(&nif->ip_addr));
    LOG(LOG_LVL_INFO, "|netif mask    = %-16s            |\r\n", ip4addr_ntoa(&nif->netmask));
    LOG(LOG_LVL_INFO, "|netif gateway = %-16s            |\r\n", ip4addr_ntoa(&nif->gw));
    LOG(LOG_LVL_INFO, "|netif mac     : [%02X:%02X:%02X:%02X:%02X:%02X] %-7s |\r\n", mac[0], mac[1], mac[2], mac[3], mac[4], mac[5], "");
    LOG(LOG_LVL_INFO, "+--------------------------------------------+\r\n");
}

static void sta_netif_status_changed_cb(struct netif *nif)
{
    LOG(LOG_LVL_INFO, "%s %d\r\n", __func__, __LINE__);
    if (!ip4_addr_cmp(ip_2_ip4(&nif->ip_addr), IP4_ADDR_ANY4))
    {
        if (dhcp_supplied_address(nif) && (nif->flags & NETIF_FLAG_UP)
            && (netif_is_link_up(nif))) {
            print_netdev_info(nif);
            if (g_get_ip_cb)
            {
                g_get_ip_cb(nif);
            }
        }
    }
}

int netdev_set_state(netif_idx_t nif_idx, netdev_state_t state)
{
    struct netif *nif = NULL;

    if (nif_idx >= NETIF_IDX_MAX) {
        LOG(LOG_LVL_ERROR, "netif idx(%d) invalid!\r\n", nif_idx);
        return -1;
    }

    nif = netdev_get_netif(nif_idx);

    if (nif_idx == NETIF_IDX_STA)
    {
        if (state == NETDEV_UP)
        {
            netifapi_netif_set_up(nif);
            netifapi_netif_set_link_up(nif);

            netif_set_status_callback(nif, sta_netif_status_changed_cb);
            //netif_set_link_callback(nif, sta_netif_link_changed_cb);

            netifapi_dhcp_release(nif);
            netifapi_dhcp_stop(nif);
            netifapi_dhcp_start(nif);
        }
        else
        {
            netifapi_netif_set_down(nif);
            netifapi_netif_set_link_down(nif);

            netifapi_dhcp_release(nif);
            netifapi_dhcp_stop(nif);
            netif_set_status_callback(nif, NULL);
            //netif_set_link_callback(nif, NULL);
        }
    }
    else if (nif_idx == NETIF_IDX_AP)
    {
        if (state == NETDEV_UP)
        {
            netifapi_netif_set_up(nif);
            netifapi_netif_set_link_up(nif);
            dhcpd_stop();
            dhcpd_start();
        }
        else
        {
            dhcpd_stop();
            netifapi_netif_set_link_down(nif);
            netifapi_netif_set_down(nif);
        }
    }


    return 0;
}

void netdev_set_active(netif_idx_t nif_idx)
{
    struct netif *nif = ethernetif_get_netdev(nif_idx);
    if (nif == NULL)
        return;
    netif_set_default(nif);
}

netif_idx_t netdev_get_active(void)
{
    wifi_mode_t mode = WIFI_MODE_STATION;

    mode = wifi_current_mode_get();
    if (mode == WIFI_MODE_STATION)
        return NETIF_IDX_STA;
    else if (mode == WIFI_MODE_STATION)
        return NETIF_IDX_AP;
}

netdev_link_state_t netdev_get_link_state(netif_idx_t nif_idx)
{
    struct netif *nif = ethernetif_get_netdev(nif_idx);

    if (netif_is_link_up(nif)) {
        return NETDEV_LINK_UP;
    } else {
        return NETDEV_LINK_DOWN;
    }
}

int netdev_set_mac_addr(netif_idx_t nif_idx, uint8_t *mac_addr)
{
    struct netif *nif = netdev_get_netif(nif_idx);

    if (nif && mac_addr) {
        memcpy(nif->hwaddr, mac_addr, NETIF_MAX_HWADDR_LEN);
        return 0;
    }
    return -1;
}

int netdev_get_mac_addr(netif_idx_t nif_idx, uint8_t *mac_addr)
{
    struct netif *nif = netdev_get_netif(nif_idx);

    if (nif && mac_addr) {
        memcpy(mac_addr, nif->hwaddr, NETIF_MAX_HWADDR_LEN);
        return 0;
    }
    return -1;
}

int netdev_set_ip_info(netif_idx_t nif_idx, tcpip_ip_info_t *ip_info)
{
    struct netif *nif = ethernetif_get_netdev(nif_idx);

    if (nif && ip_info) {
        netifapi_netif_set_addr(nif, &ip_info->ip, &ip_info->netmask, &ip_info->gw);
        return 0;
    }
    return -1;
}

int netdev_get_ip_info(netif_idx_t nif_idx, tcpip_ip_info_t *ip_info)
{
    struct netif *nif = ethernetif_get_netdev(nif_idx);

    if (nif && ip_info) {
        memcpy(&ip_info->ip,      &(nif->ip_addr), sizeof(ip4_addr_t));
        memcpy(&ip_info->netmask, &(nif->netmask), sizeof(ip4_addr_t));
        memcpy(&ip_info->gw,      &(nif->gw),      sizeof(ip4_addr_t));
        return 0;
    }
    return -1;
}

void netdev_get_ip_cb_set(netdev_get_ip_cb_t cb)
{
    g_get_ip_cb = cb;
}

netdev_get_ip_cb_t netdev_get_ip_cb_get(void)
{
    return g_get_ip_cb;
}
