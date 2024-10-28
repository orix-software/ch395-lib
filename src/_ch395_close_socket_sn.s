.include "ch395.inc"

.export _ch395_close_socket_sn
.import ch395_close_socket_sn

.proc _ch395_close_socket_sn
    ;;@proto void ch395_close_socket_sn(unsigned char socketid)
    ;;@brief This command is used to close Socket. It is necessary to input a 1 byte of Socket index value. After Socket is closed, the receive buffer and transmit buffer of Socket are emptied, but the configuration information is still reserved, and you just need to open the Socket again when using the Socket the next time. In TCP mode, CH395 will automatically disconnect TCP before turning off Socket.
    ;;@inputPARAM_socketid The socketid
    ;;@```c
    ;;@`  ch395_close_socket_sn(CH395_SOCKET1);
    ;;@```
    jmp     ch395_close_socket_sn
.endproc

