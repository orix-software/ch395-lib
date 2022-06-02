.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.proc _ch395_retran_period
    ldy     #CH395_SET_RETRAN_PERIOD
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    stx     CH395_DATA_PORT
    rts
.endproc
