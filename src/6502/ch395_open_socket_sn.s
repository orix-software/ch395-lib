.include "ch395.inc"

.export ch395_open_socket_sn

.proc ch395_open_socket_sn
    ;;@brief Open socket from arg
    ;;@inputA Socket id
    ;;@modifyY
    ldy     #CH395_OPEN_SOCKET_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
