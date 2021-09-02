#include "ch395.h"
#include <string.h>
#include <stdio.h>
#include <telestrat.h>

#include <conio.h>
unsigned char enable_dhcp;

void status() {
    
    cputsxy(2,7,"Firmware version :");
    cputsxy(2,8,"IP address : ");
}

void quit() {

}

unsigned char config () {
    unsigned char key;
    unsigned char current_menu=0;
    while (1) {
        if (current_menu==0) bgcolor(COLOR_GREEN);
        if (enable_dhcp==1)
            cputsxy(2,7,"Enable DHCP : [X]");
        else
            cputsxy(2,7,"Enable DHCP : [ ]");
        
        cclearxy (0,8,13);
        key=cgetc();
        if (key==8 || key==27 || key==9) {
            cclearxy (0,7,20);
            break;
        }
        if (key==' ') {
            if (current_menu==0) {
                if (enable_dhcp==1) 
                    enable_dhcp=0;
                else
                    enable_dhcp=1;
            }
        }
    }
    return key;
}

void menu (unsigned char current_menu) {
    
    if (current_menu==0)
        bgcolor (COLOR_RED);
    else
    {
        bgcolor (COLOR_BLACK); 
    }
    

    cputsxy(2,5,"STATUS");

    if (current_menu==1)
        bgcolor (COLOR_RED);
    else
    {
        bgcolor (COLOR_BLACK); 
    }

    cputsxy(10,5,"CONFIG");
    
    if (current_menu==2)
        bgcolor (COLOR_RED);
    else
    {
        bgcolor (COLOR_BLACK); 
    }
    
    cputsxy(18,5,"QUIT");
    
    bgcolor (COLOR_BLACK);
    gotoxy(24,5);
    cputc(' '); 
    

}

static unsigned char macaddress[8];
static unsigned char ip_infos[20];

int main() {
    unsigned char version;
    unsigned char current_menu=0;
    unsigned char key;
    unsigned char validate=1;
    unsigned char redraw=1;
    unsigned char checkexist;
    static unsigned char ret;
    static unsigned int i=0;
    unsigned int length=0;
    unsigned int nb_ok=0;
    unsigned char ip_addr_dest[]={192,168,1,75};
    unsigned int portDst=80;
    unsigned char setmacaddressforge[]={0x84,0xc2,0xe4,0xef,0x0f,0x0d};
    char getUrl[100]={'G','E','T',' ','/',0x0d,0x0a,0x0d,0x0a};
    unsigned char testBusy=0;
    unsigned char error=0;
    unsigned char *ret_ptr;
    

    
    version=ch395_get_ic_ver();
    printf("Version : %d\n",version);
    if (version==0) {
        printf("Exit with version equal to 0 ! reset is starting\n");
        // reset
        ch395_reset_all();
        return 0;
    }
/*
    checkexist=ch395_check_exist();
    printf("Check exist : %x\n",checkexist);
    printf("Ch395 init\n");
    ch395_init();
    while ((ret=ch395_get_cmd_status())!=CH395_ERR_SUCCESS) {
        printf("Waiting status for init : %x\n",ret);
        if (ret==CH395_ERR_BUSY) testBusy++;
        if (testBusy==15) { 
            error=1;
            break;
        }
    }
    // Set mac address
    //
    //ch395_set_mac_adress(setmacaddressforge);
    // Test for cable disconnected must be _AFTER_ ch395 init

    if (ret==CH395_PHY_DISCONN) {
        printf("Error : Cable disconnected\n");
        return 0;
    }

        if (error==1) {
            printf("Exit with busy reached ! reset is starting\n");
            // reset
            ch395_reset_all();
            return 0;
        }
        printf("Ch395 stack init success ! \n");

        ch395_get_ip_inf(ip_infos);
        // No ip affected start dhcp
        if (ip_infos[0]==0) {
            printf("Start dhcp\n");
            ch395_dhcp_enable(CH395_DHCP_ENABLE);
            while ((ret=ch395_get_dhcp_status())==CH395_DHCP_STATUS_DISABLED)
                printf("Dhcp status : %x\n",ret);
            printf("Dhcp started\n");
        }
    //}
    
    //while (1) {
      //  i++;
        ch395_get_mac_adress(macaddress);
        if (macaddress[0]==0x84 && macaddress[1]==0xc2 && macaddress[2]==0xe4 && macaddress[3]==0xef && macaddress[4]==0x0f && macaddress[5]==0x0d) nb_ok++;
        //if (macaddress[0]==0x00 && macaddress[1]==0x03 && macaddress[2]==0x46 && macaddress[3]==0x46 && macaddress[4]==0x80 && macaddress[5]==0x80) nb_ok++;
            printf("Mac address : %x:%x:%x:%x:%x:%x %d/%d\n",macaddress[0],macaddress[1],macaddress[2],macaddress[3],macaddress[4],macaddress[5],nb_ok,i);
        //if (i==100) break;
    //}
    //return 0;
    // 84:c2:e4:ef:0f:0d
    
  

    printf("Ip : %d.%d.%d.%d\n",ip_infos[0],ip_infos[1],ip_infos[2],ip_infos[3]);
    printf("Gateway : %d.%d.%d.%d\n",ip_infos[4],ip_infos[5],ip_infos[6],ip_infos[7]);
    printf("Mask : %d.%d.%d.%d\n",ip_infos[8],ip_infos[9],ip_infos[10],ip_infos[11]);
    printf("DNS1 : %d.%d.%d.%d\n",ip_infos[12],ip_infos[13],ip_infos[14],ip_infos[15]);
    printf("DNS2 : %d.%d.%d.%d\n",ip_infos[16],ip_infos[17],ip_infos[18],ip_infos[19]);

    //ch395_close_socket_sn(CH395_SOCKET0);
   */ 
    ret_ptr=ch395_get_socket_status_sn(CH395_SOCKET0); // return 2 bytes
    if (ret_ptr[0]==CH395_SOCKET_OPEN) {
        ch395_close_socket_sn(CH395_SOCKET0);  
        printf("Closing socket ...\n");
    }
    printf("Connection to %d.%d.%d.%d:%d\n",ip_addr_dest[0],ip_addr_dest[1],ip_addr_dest[2],ip_addr_dest[3],portDst);
    printf("Setting Proto\n");
    ch395_set_proto_type_sn(CH395_PROTO_TYPE_TCP,CH395_SOCKET0);
    printf("Setting IP\n");
    ch395_set_ip_addr_sn(ip_addr_dest,CH395_SOCKET0);
   
    printf("Setting dest port %d\n",portDst);
    ch395_set_des_port_sn(portDst,CH395_SOCKET0);
    printf("Setting source port\n");
    ch395_set_sour_port_sn(200,CH395_SOCKET0);

    ch395_open_socket_sn(CH395_SOCKET0);
    while ((ret=ch395_get_cmd_status())!=CH395_ERR_SUCCESS) {
    //while (1)
        
        if (ret==CH395_ERR_BUSY)
            printf("Socket open ... Busy\n");
        //if (ret==CH395_ERR_OPEN) break;
    }
    //printf("Open Socket : %x\n",ret);
    printf("Connection OK !\n");
    printf("Tcp connect now\n");
    ch395_tcp_connect_sn(CH395_SOCKET0);
    while ((ret=ch395_get_cmd_status())!=CH395_ERR_SUCCESS) {
        printf("Waiting for tcp connect : %x\n",ret);
        /*
        if (ret==CH395_ERR_ISCONN)
            break;
        if (ret==CH395_ERR_CLSD) {
            printf("Tcp connection closed\n");
            break;
            
        }
        */
    }
    printf("Tcp connect ok %x\n",ret);
    ret=ch395_get_int_status_sn(CH395_SOCKET0);
    printf("Ret : %d",ret);

    //strcpy(getUrl,"GET /");
    ch395_write_send_buf_sn(getUrl, 9,CH395_SOCKET0);
    length=ch395_get_recv_len_sn(CH395_SOCKET0);
    printf("Length received : %d\n",length);

    
    ch395_close_socket_sn(CH395_SOCKET0);
    

    return 0;

}

