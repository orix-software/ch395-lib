#include "ch395.h"
#include <string.h>

#include <conio.h>

void menu () {

}

char *firmware_version_str="CH395 firmware version : ";

int main() {

unsigned char version;
clrscr();

version=ch395_get_ic_ver();
textcolor(COLOR_MAGENTA);
cputsxy(0,0,"CH395 Config tool");
cputsxy(0,2,firmware_version_str);
//cputsxy(strlen(firmware_version_str)+2,2,ch395_get_ic_ver());


return 0;
}

