.include "ch395.inc"

.export ch395_reset_all

.proc ch395_reset_all
    ;;@brief This command enables CH395 to perform a hardware reset. Typically, hardware reset is completed within 50mS.
    ;;@```ca65
    ;;@`  jsr       ch395_reset_all
    ;;@`  ; Wait a bit
    ;;@```
    lda     #CH395_RESET_ALL
    sta     CH395_COMMAND_PORT
    rts
.endproc
