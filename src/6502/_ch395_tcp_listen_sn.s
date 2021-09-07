.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif    

.export _ch395_tcp_listen_sn

; void ch395_tcp_listen_sn(unsigned char ID_SOCKET)

.proc _ch395_tcp_listen_sn
    ldy     #CH395_TCP_LISTEN_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
