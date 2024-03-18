.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_close_socket_sn
.export ch395_close_socket_sn

.proc _ch395_close_socket_sn
    ;;@proto void ch395_close_socket_sn(unsigned char socketid)
    ;;@brief This command is used to close Socket. It is necessary to input a 1 byte of Socket index value. After Socket is closed, the receive buffer and transmit buffer of Socket are emptied, but the configuration information is still reserved, and you just need to open the Socket again when using the Socket the next time. In TCP mode, CH395 will automatically disconnect TCP before turning off Socket.
    ;;@inputPARAM_socketid The socketid
    ;;@```c
    ;;@`  ch395_close_socket_sn(CH395_SOCKET1);
    ;;@```
.endproc


.proc ch395_close_socket_sn
    ;;@brief This command is used to close Socket. It is necessary to input a 1 byte of Socket index value. After Socket is closed, the receive buffer and transmit buffer of Socket are emptied, but the configuration information is still reserved, and you just need to open the Socket again when using the Socket the next time. In TCP mode, CH395 will automatically disconnect TCP before turning off Socket.
    ;;@inputA The id of the socket to close
    ;;@modifyY
    ;;@```ca65
    ;;@`  lda #$01 ; Socket ID
    ;;@`  jsr ch395_close_socket_sn
    ;;@```
    ldy     #CH395_CLOSE_SOCKET_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
