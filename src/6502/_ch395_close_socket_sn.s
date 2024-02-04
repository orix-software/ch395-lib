.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_close_socket_sn
.export ch395_close_socket_sn

.proc _ch395_close_socket_sn
    ;;@proto oid ch395_close_socket_sn(unsigned char ID_SOCKET)
    ;;@brief Close socket
.endproc


.proc ch395_close_socket_sn
    ;;@brief Close socket
    ;;@```ca65
    ;;@`  lda #$01 ; Socket ID
    ;;@`  jsr ch395_close_socket_sn
    ;;@```
    ;;@inputA The id of the socket to close
    ;;@modifyY
    ldy     #CH395_CLOSE_SOCKET_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
