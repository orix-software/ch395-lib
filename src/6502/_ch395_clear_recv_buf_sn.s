.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_clear_recv_buf_sn
.export ch395_clear_recv_buf_sn

.proc _ch395_clear_recv_buf_sn
    ;;@proto void ch395_clear_recv_buf_sn(unsigned char ID_SOCKET)
    ;;@brief This command is used to clear the Socket receive buffer. It is necessary to input 1 byte of Socket index value. Upon receiving this command, CH395 will reset the receiving length of this Socket, and the receiving pointer will point to the buffer head.
    ;;@```c
    ;;@`  ch395_clear_recv_buf_sn(CH395_SOCKET1);
    ;;@```
.endproc


.proc ch395_clear_recv_buf_sn
    ;;@brief This command is used to clear the Socket receive buffer. It is necessary to input 1 byte of Socket index value. Upon receiving this command, CH395 will reset the receiving length of this Socket, and the receiving pointer will point to the buffer head.
    ;;@inputA Socket id
    ;;@modifyA
    ;;@modifyY
    ;;@```ca65
    ;;@`  lda #CH395_SOCKET1 ; Socket ID
    ;;@`  jsr ch395_clear_recv_buf_sn
    ;;@```
    ldy     #CH395_CLEAR_RECV_BUF_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
