.include "ch395.inc"

.export _ch395_tcp_listen_sn
.export ch395_tcp_listen_sn

.proc _ch395_tcp_listen_sn
    ;;@proto void ch395_tcp_listen_sn(unsigned char ID_SOCKET)
.endproc

.proc ch395_tcp_listen_sn
    ;;@brief TCP listen socket
    ;;inputA SocketID
    ;;modifyY
    ldy     #CH395_TCP_LISTEN_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
