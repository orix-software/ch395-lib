#include <stdio.h>
#include "ch395.h"
#include <conio.h>


void display_state(){
    unsigned char socket;
    int valax;
    unsigned char socket_state;
    unsigned char socket_tcp_state;
        for (socket=0;socket<8;socket ++)
    {
        printf("Socket %d: ",socket);
        valax = ch395_get_socket_status_sn(socket);
        socket_state = (unsigned char)(valax & 0xFF);
        socket_tcp_state = (unsigned char)(valax >> 8);
        if (socket_state == CH395_SOCKET_OPEN) {
            printf("Opened");
        }
        if (socket_state== CH395_SOCKET_CLOSED) {
            printf("Closed");
        }
        switch(socket_tcp_state){
            case CH395_TCP_CLOSED:
                printf(" TCP_CLOSED");
                break;
                    case CH395_TCP_LISTEN:
                        printf(" TCP_LISTEN");
                        break;
                    case CH395_TCP_SYN_SENT:
                        printf(" TCP_SYN_SENT");
                        break;
                    case CH395_TCP_SYN_REVD:
                        printf(" TCP_SYN_REVD");
                        break;
                    case CH395_TCP_ESTABLISHED:
                        printf(" TCP_ESTABLISHED");
                        break;
                    case CH395_TCP_FIN_WAIT_1:
                        printf(" TCP_FIN_WAIT_1");
                        break;
                    case CH395_TCP_FIN_WAIT_2:
                        printf(" TCP_FIN_WAIT_2");
                        break;
                    case CH395_TCP_CLOSE_WAIT:
                        printf(" CLOSE_WAIT");
                        break;
                    case CH395_TCP_CLOSING:
                        printf(" TCP_CLOSING");
                        break;
                    case CH395_TCP_LAST_ACK:
                        printf(" LAST_ACK");
                        break;
                    case CH395_TCP_TIME_WAIT:
                        printf(" TCP_TIME_WAIT");
                        break;
        }

        printf("\n");
    }
}

void menu(){
    puts("r Refresh");
    puts("c Close socket");
    puts("q Quit");
}

int main() {

    unsigned char key;
    display_state();
    menu();
    while(1) {
        key = cgetc();
        if (key == 'r') {
            display_state();
            menu();
        }
        if (key == 'q') return 0;
        if (key == 'c') {
            printf("Id if the socket : ");
            key = cgetc();
            key = key - 0x30;
            printf("Choice %d : \n",key);
            printf("Closing socket %d\n", key);
            ch395_close_socket_sn(key);
            display_state();
            menu();

        }
    }



}
