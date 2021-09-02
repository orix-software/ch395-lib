.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif    

.export _ch395_close_socket_sn

; void ch395_close_socket_sn(unsigned char ID_SOCKET)

.proc _ch395_close_socket_sn
    ldy     #CH395_CLOSE_SOCKET_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
