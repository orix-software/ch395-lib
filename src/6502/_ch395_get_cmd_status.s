
.include "../include/ch395.inc"

.export _ch395_get_cmd_status

.proc _ch395_get_cmd_status
	lda     #CH395_GET_CMD_STATUS
    sta     CH395_COMMAND_PORT
    lda     CH395_DATA_PORT
.ifdef      FROM_ASSEMBLY    
.else
    ldx     #$00
.endif
    rts
.endproc

