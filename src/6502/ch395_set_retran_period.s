.include "ch395.inc"

.export ch395_set_retran_period

.proc ch395_set_retran_period
    ;;@brief This command is used to set the retry cycle. It is necessary to input 2 bytes of number of cycles of (with low bytes in front) in milliseconds. The allowable maximum value is 1000. The total retry time is N * M, N is the number of retries, and M is the retry cycle. The default retry cycle is 500MS and retries are only valid in TCP mode.
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
