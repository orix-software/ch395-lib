.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_retran_period
.export ch395_retran_period

.proc _ch395_retran_period
.endproc

.proc ch395_retran_period
    ;;@brief Retran period
    ;;@```ca65
    ;;@`  lda       #$FF
    ;;@`  ldx       #$FF
    ;;@`  jsr       ch395_retran_period
    ;;@`  rts
    ;;@```
    ;;@inputA Period
    ;;@inputX Period
    ;;@modifyY
    ldy     #CH395_SET_RETRAN_PERIOD
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    stx     CH395_DATA_PORT
    rts
.endproc
