.include "ch395.inc"

.export _ch395_tcp_connect_sn
; void ch395_tcp_connect_sn(unsigned char ID_SOCKET)
.proc _ch395_tcp_connect_sn
    ldy     #CH395_TCP_CONNECT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc