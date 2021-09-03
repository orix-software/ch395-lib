.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif    

.importzp ptr1

.export _ch395_get_glob_int_status

.proc _ch395_get_glob_int_status
    
	lda     #CH395_GET_GLOB_INT_STATUS
    sta     CH395_COMMAND_PORT

    lda     CH395_DATA_PORT
    ldx     CH395_DATA_PORT
    rts
.endproc

