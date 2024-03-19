.include "ch395.inc"

.export ch395_tcp_listen_sn

.proc ch395_tcp_listen_sn
    ;;@brief TCP listen socket
    ;;inputA SocketID
    ;;modifyY
    ldy     #CH395_TCP_LISTEN_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
