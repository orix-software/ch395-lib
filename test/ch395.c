#include <stdio.h>
#include "ch395.h"

int dhcp_enable() {
    unsigned char val;
    unsigned int retry;

    ch395_dhcp_enable(CH395_DHCP_ENABLE_VAL);

    retry = 0;
    while (1)  {
        val = ch395_get_glob_int_status();
        printf("%d,",val);
        if ((val & CH395_GINT_STAT_DHCP) == CH395_GINT_STAT_DHCP) break;
        retry ++;
        printf("#");
        if (retry == 29000) {
            printf("Unable to start dhcp");
            return 4;
        }
    }

    printf("Dhcp started");
}

int main() {
    unsigned int port = 80;
    unsigned int retry;
    unsigned char ip[]= { 54, 36, 50, 190 };
    unsigned char val;
    unsigned char myip[20];

    val = ch395_check_exist();
    if (val != CH395_DETECTED) {
        printf("CH395 not found exiting ...\n");
        return 1;
    }

    val = ch395_get_ic_ver();
    printf("Ch395 found ! Version : %d. Initialize chip ...\n", val);
    ch395_init();
    retry = 0;
    while (1) {
        val = ch395_get_cmd_status();
        if (val == 0) break;
        retry++;
        if (retry == 2000) {
            printf("Impossible to init ch395\n");
            return 2;
        };
    }

    printf("Initialized, checking cable\n");

    retry = 0;
    while (1) {
        val = ch395_get_phy_status();

        if ( val != CH395_PHY_DISCONN)
            break;
        retry ++;
        if (retry == 9000) {
            printf("Cable is disconnected\n");
            return 3;
        };
    }
    printf("Cable is connected, Starting dhcp\n");

    val = ch395_get_dhcp_status();
    if (val == CH395_DHCP_STATUS_ENABLED)
        printf("DHCP Already enabled\n");
    else
        dhcp_enable();


    ch395_get_ip_inf(myip);

    printf("My IP : %d.%d.%d.%d\n",myip[0],myip[1],myip[2],myip[3]);

    printf("IP dest : %d.%d.%d.%d:%d\n",ip[0],ip[1],ip[2],ip[3],port);

    ch395_set_proto_type_sn(CH395_PROTO_TYPE_TCP,0);

    ch395_set_ip_addr_sn(ip,0);
    ch395_set_des_port_sn(port,0);
    ch395_set_sour_port_sn(200,0)


    ch395_open_socket_sn(0);

    val = ch395_get_socket_status_sn(0);

}
