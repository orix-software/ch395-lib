#include <stdio.h>
#include "ch395.h"

int main() {
    unsigned int port = 80;
    unsigned char ip[]= { 54, 36, 50, 190 };
    unsigned char val;

    val = ch395_check_exist();
    if (val == CH395_DETECTED) {
        val = ch395_get_ic_ver();
        printf("Ch395 found ! Version : %d. Initialize chip ...\n", val);
        ch395_init();
    }
    else {
        printf("CH395 not found exiting ...\n");
        return 1;
    }

    printf("IP : %d.%d.%d.%d\n",ip[0],ip[1],ip[2],ip[3]);


}