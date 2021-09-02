.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_check_exist

.proc _ch395_check_exist
	lda     #CH395_CHECK_EXIST
    sta     CH395_COMMAND_PORT
    lda     #$55
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
.ifdef      FROM_ASSEMBLY    
.else
    ldx     #$00
.endif    
    rts
.endproc

