.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_retran_period
.export ch395_retran_period

.proc _ch395_retran_period
    ;;@proto void          ch395_retran_period(unsigned int period);
    ;;@brief Retran period
    ;;@```c
    ;;@`  ch395_retran_period(1000)
    ;;@```
.endproc

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
