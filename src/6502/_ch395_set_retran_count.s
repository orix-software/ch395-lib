.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_set_retran_count
.export ch395_set_retran_count

.proc _ch395_set_retran_count
.endproc

.proc ch395_set_retran_count
    ldx     #CH395_SET_RETRAN_COUNT
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    rts
.endproc
