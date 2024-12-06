#include <stdio.h>
#include <conio.h>
#include "ch395.h"

void check_dhcp_status() {
    unsigned char val;
    val = ch395_get_dhcp_status();
    if (val == CH395_DHCP_STATUS_ENABLED)
        printf("DHCP Already enabled\n");
    else
        printf("DHCP disabled\n");
}

int init_chip() {
    unsigned char val;
    int retry;
    int max_retry = 200;
    printf("Initialize chip ...\n");
    ch395_init();
    retry = 0;
    while (1) {
        val = ch395_get_cmd_status();
        if (val == 0) break;
        retry++;
        if (retry == max_retry) {
            printf("Impossible to init ch395\n");
            return 2;
        }
        else {
            printf("Waiting for init %d/%d\n", retry, max_retry);
        }
    }
}

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

void menu() {

    printf("######################################\n");
    printf("#          ch395 test program        #\n");
    printf("######################################\n");
    printf("1. Init ch395\n");
    printf("2. Get Mac address\n");
    printf("3. Check exist\n");
    printf("4. Ic version\n");
    printf("5. Check cable\n");
    printf("6. Get ip\n");
    printf("7. Get dhcp status\n");
    printf("0. Exit \n");

}

void get_mac_address() {
    unsigned char mac[7] = {0,0,0,0,0,0,0};
    ch395_get_mac_adress(mac);
    printf("%02X:%02X:%02X:%02X:%02X:%02X\n", mac[0],mac[1],mac[2],mac[3],mac[4],mac[5]);
}

int check_exist() {
    unsigned char val;
    val = ch395_check_exist();
    if (val != CH395_DETECTED) {
        printf("CH395 not found exiting ...\n");
        return 1;
    }
    else {
        printf("CH395 Found ...\n");
        return 0;
    }
}

void get_ic_ver() {
    unsigned char val;
    val = ch395_get_ic_ver();
    printf("Ch395 found ! Version : %d.", val);
}

void check_cable() {

    unsigned char val;
    unsigned int retry;
    unsigned int max_retry = 200;
    printf("Checking cable\n");

    retry = 0;
    while (1) {
        val = ch395_get_phy_status();
        if (max_retry == retry) {
            printf("Never connected ");
            return;
        }
        if ( val != CH395_PHY_DISCONN) {
            printf("val for cable state : %d\n", val);
            break;
        }
        retry ++;
        printf("Cable is disconnected %d/%d\n", retry, max_retry);
    }
    printf("Cable is connected\n");
}

void get_ip_inf() {
    unsigned char myip[20];
    ch395_get_ip_inf(myip);
    printf("My IP : %d.%d.%d.%d\n",myip[0],myip[1],myip[2],myip[3]);
}

int main() {
    unsigned int port = 80;
    unsigned int retry;
    unsigned char ip[]= { 54, 36, 50, 190 };
    unsigned char val;

    unsigned char key;


    while (1) {

        menu();
        key = cgetc();

        if (key == '1')
            init_chip();

        if (key == '2')
            get_mac_address();

        if (key == '3')
            check_exist();

        if (key == '4')
            get_ic_ver();

        if (key == '5')
            check_cable();

        if (key == '6')
            get_ip_inf();

        if (key == '7')
            check_dhcp_status();

        if (key == '0') {
            clrscr();
            return 0;
        }

        printf("\nPress a key to continue\n");
        cgetc();
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






    printf("IP dest : %d.%d.%d.%d:%d\n",ip[0],ip[1],ip[2],ip[3],port);

    ch395_set_proto_type_sn(CH395_PROTO_TYPE_TCP,0);

    ch395_set_ip_addr_sn(ip,0);
    ch395_set_des_port_sn(port,0);
    ch395_set_sour_port_sn(200,0);

    ch395_open_socket_sn(0);

    val = ch395_get_cmd_status();

    retry = 0;

    val = ch395_get_socket_status_sn(0);

    ch395_close_socket_sn(0);

}
