.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_reset_all

.proc _ch395_reset_all
    lda     #CH395_RESET_ALL
    sta     CH395_COMMAND_PORT
    rts
.endproc
