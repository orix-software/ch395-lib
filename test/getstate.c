#include <stdio.h>
#include "ch395.h"
#include <conio.h>


void display_state(){
    unsigned char socket;
    int valax;
    unsigned char socket_state;
    unsigned char socket_tcp_state;
    unsigned char version;
    version = ch395_get_ic_ver();
    printf("CH395 version (ch395_get_ic_ver): %d\n",version);
    for (socket=0;socket<8;socket ++) {
        printf("Socket %d: ",socket);
        valax = ch395_get_socket_status_sn(socket);
        socket_state = (unsigned char)(valax & 0xFF);
        socket_tcp_state = (unsigned char)(valax >> 8);
        if (socket_state == CH395_SOCKET_OPEN) {
            printf("Opened");
        }
        if (socket_state == CH395_SOCKET_CLOSED) {
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

void all_states()
{
    unsigned char socket;
    unsigned char data;
    for (socket=0;socket<8;socket ++) {
        printf("Socket %d:\n",socket);
        data = ch395_get_int_status_sn(socket);
        printf("Decimal value : %d\n", data);

        if (data & CH395_SINT_STAT_TIM_OUT == CH395_SINT_STAT_TIM_OUT)
        {
            printf(" CH395_SINT_STAT_TIM_OUT");
        }

        if (data & CH395_SINT_STAT_DISCONNECT == CH395_SINT_STAT_DISCONNECT)
        {
            printf(" CH395_SINT_STAT_DISCONNECT");
        }

        if (data & CH395_SINT_STAT_CONNECT == CH395_SINT_STAT_CONNECT)
        {
            printf(" CH395_SINT_STAT_CONNECT");
        }

        if (data & CH395_SINT_STAT_RECV == CH395_SINT_STAT_RECV)
        {
            printf(" CH395_SINT_STAT_RECV");
        }

        if (data & CH395_SINT_STAT_SEND_OK == CH395_SINT_STAT_SEND_OK)
        {
            printf(" CH395_SINT_STAT_SEND_OK");
        }

        if (data & CH395_SINT_STAT_SENBUF_FREE == CH395_SINT_STAT_SENBUF_FREE)
        {
            printf(" CH395_SINT_STAT_SENBUF_FREE");
        }
    }
//
}

void menu(){
    puts("r Refresh");
    puts("c Close socket");
    puts("i Display all interrupts sockets status (ch395_get_int_status_sn)");
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
        if (key == 'i') {
            all_states();
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
