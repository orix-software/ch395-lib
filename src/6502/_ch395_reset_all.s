
.include "ch395.inc"

.export _ch395_reset_all

.proc _ch395_reset_all
    lda #CH395_RESET_ALL
    rts
.endproc


