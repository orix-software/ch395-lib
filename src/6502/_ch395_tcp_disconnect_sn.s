.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_tcp_disconnect_sn
.export ch395_tcp_disconnect_sn

.proc _ch395_tcp_disconnect_sn
.endproc

; void ch395_tcp_disconnect_sn(unsigned char ID_SOCKET)

.proc ch395_tcp_disconnect_sn
    ldy     #CH395_TCP_DISNCONNECT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
