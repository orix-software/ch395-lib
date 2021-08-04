
.include "../include/ch395.inc"

.export _ch395_get_int_status_sn
; unsigned char ch395_get_int_status_sn(unsigned char ID_SOCKET);
.proc _ch395_get_int_status_sn
	ldx     #CH395_GET_INT_STATUS_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
.ifdef      FROM_ASSEMBLY    
.else
    ldx     #$00
.endif
    rts
.endproc

