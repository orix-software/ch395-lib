.include "ch395.inc"

.export ch395_tcp_connect_sn

.proc ch395_tcp_connect_sn
    ;;@inputA Socket id
    ldy     #CH395_TCP_CONNECT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
