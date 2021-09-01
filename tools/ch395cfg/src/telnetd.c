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
    unsigned int score=0;
    unsigned int nb_ok=0;
    unsigned char ip_addr_dest[]={192,168,1,75};
    unsigned int portDst=80;
    unsigned char setmacaddressforge[]={0x84,0xc2,0xe4,0xef,0x0f,0x0d};
    char getUrl[100];
    unsigned char testBusy=0;
    unsigned char error=0;
    

    
    version=ch395_get_ic_ver();
    printf("Version : %d\n",version);
    if (version==0) {
        printf("Exit with version equal to 0 ! reset is starting\n");
        // reset
        ch395_reset_all();
        return 0;
    }

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
    ch395_set_mac_adress(setmacaddressforge);
    // Test for cable disconnected must be _AFTER_ ch395 init
    /*
    if (ret==CH395_PHY_DISCONN) {
        printf("Error : Cable disconnected\n");
        return 0;
    }
*/
        if (error==1) {
            printf("Exit with busy reached ! reset is starting\n");
            // reset
            ch395_reset_all();
            return 0;
        }
        printf("Ch395 stack init success ! \n");
        printf("Start dhcp\n");
        ch395_dhcp_enable(CH395_DHCP_ENABLE);
        while ((ret=ch395_get_dhcp_status())==CH395_DHCP_STATUS_DISABLED)
            printf("Dhcp status : %x\n",ret);
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
    
    printf("Dhcp started\n");
    ch395_get_ip_inf(ip_infos);
    printf("Ip : %d.%d.%d.%d\n",ip_infos[0],ip_infos[1],ip_infos[2],ip_infos[3]);
    printf("Gateway : %d.%d.%d.%d\n",ip_infos[4],ip_infos[5],ip_infos[6],ip_infos[7]);
    printf("Mask : %d.%d.%d.%d\n",ip_infos[8],ip_infos[9],ip_infos[10],ip_infos[11]);
    printf("DNS1 : %d.%d.%d.%d\n",ip_infos[12],ip_infos[13],ip_infos[14],ip_infos[15]);
    printf("DNS2 : %d.%d.%d.%d\n",ip_infos[16],ip_infos[17],ip_infos[18],ip_infos[19]);


    //printf("Connection to %d.%d.%d.%d:%d\n",ip_addr_dest[0],ip_addr_dest[1],ip_addr_dest[2],ip_addr_dest[3],portDst);
    printf("Starting server ... \n" );
    ch395_close_socket_sn(CH395_SOCKET1);
    printf("Setting Proto\n");
    ch395_set_proto_type_sn(CH395_PROTO_TYPE_TCP,CH395_SOCKET1);

    printf("Setting source port\n");
    ch395_set_sour_port_sn(200,CH395_SOCKET1);

    ch395_open_socket_sn(CH395_SOCKET1);
    while ((ret=ch395_get_cmd_status())!=CH395_ERR_SUCCESS) {
        if (ret==CH395_ERR_BUSY)
            printf("Socket open ... Busy\n");
    }
    printf("Tcp connect now in server mode\n");
    printf("Waiting for connection...");
    while (1) {
        ret=ch395_get_int_status_sn(CH395_SOCKET1);

        if (ret!=0) {
            printf("Something is connected");
            break;
        }
    }

  //  strcpy(getUrl,"GET /oric/jede.html");
    //ch395_write_send_buf_sn(getUrl, 15,CH395_SOCKET0);
    ch395_close_socket_sn(CH395_SOCKET1);
    

    return 0;

    clrscr();
    
    
    bgcolor (COLOR_BLUE);
    textcolor(COLOR_WHITE);
    gotoxy(2,1);
    cputs("+------------------------------------+");
    gotoxy(2,2);
   
    cputs("|          CH395 Config tool         |");
    gotoxy(2,3);
    cputs("+------------------------------------+");

    while (1) {
        menu(current_menu);
        if (current_menu==0) status();
        if (current_menu==1) {
            key=config();
            redraw=0;
        }            
        if (current_menu==2 && validate==0) break;
        if (validate==0) validate=1;

        if (redraw==1) 
            key=cgetc();
        else
            redraw=1;

        if (key==9) {
            if (current_menu!=2)
                current_menu++;
        }
        if (key==8) {
            if (current_menu!=0)
                current_menu--;
        }
        if (key==13)
            validate=0;

        if (key==27) break;
    }
    clrscr();
    /* 

    */
    //cputsxy(0,2,firmware_version_str);
    //cputsxy(strlen(firmware_version_str)+2,2,ch395_get_ic_ver());

return 0;
}

