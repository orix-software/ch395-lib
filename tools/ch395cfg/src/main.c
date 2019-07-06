#include "ch395.h"
#include <string.h>
#include <telestrat.h>

#include <conio.h>

void menu () {

}

char *firmware_version_str="CH395 firmware version : ";
char *ipaddress_str="IP address : ";

int main() {
    unsigned char version;
    clrscr();

    //version=ch395_get_ic_ver();
    bgcolor (COLOR_BLUE);
    textcolor(COLOR_WHITE);
    gotoxy(2,1);
    cputs("+---------------------------------+");
    gotoxy(2,2);
   
    cputs("|          CH395 Config tool      |");
    gotoxy(2,3);
    cputs("+---------------------------------+");
    gotoxy(2,5);
    bgcolor (COLOR_MAGENTA);
    cputs(firmware_version_str);
    gotoxy(2,7);
    cputs(ipaddress_str);
    
    //cputsxy(0,2,firmware_version_str);
    //cputsxy(strlen(firmware_version_str)+2,2,ch395_get_ic_ver());

return 0;
}

