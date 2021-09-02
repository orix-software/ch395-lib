.include "ch395.inc"



.export _ch395_get_recv_len_sn
; void ch395_get_recv_len_sn(unsigned char ID_SOCKET)
.proc _ch395_get_recv_len_sn
    ldx     #CH395_GET_RECV_LEN_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; send socket
    lda     CH395_DATA_PORT ; get length
    ldx     CH395_DATA_PORT ; get length
    rts
.endproc