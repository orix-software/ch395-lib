.include "ch395.inc"

.export ch395_retran_period

.proc ch395_retran_period
    ;;@brief Retran period
    ;;@inputA Period
    ;;@inputX Period
    ;;@modifyY
    ;;@```ca65
    ;;@`  lda       #$FF
    ;;@`  ldx       #$FF
    ;;@`  jsr       ch395_retran_period
    ;;@`  rts
    ;;@```
    ldy     #CH395_SET_RETRAN_PERIOD
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    stx     CH395_DATA_PORT
    rts
.endproc
