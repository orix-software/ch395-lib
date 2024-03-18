.include "ch395.inc"

.export ch395_reset_all

.proc ch395_reset_all
    ;;@brief Reset ch395
    ;;@```ca65
    ;;@`  jsr       ch395_reset_all
    ;;@`  ; Wait a bit
    ;;@```
    lda     #CH395_RESET_ALL
    sta     CH395_COMMAND_PORT
    rts
.endproc
