.include "ch395.inc"

.importzp ptr1

.export _ch395_open_socket_sn
; void ch395_open_socket_sn(unsigned char ID_SOCKET)
.proc _ch395_open_socket_sn
    ldy     #CH395_OPEN_SOCKET_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc