.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_reset_all
.export ch395_reset_all

.proc _ch395_reset_all
    ;;@proto void ch395_reset_all()
    ;;@brief Reset ch395
    ;;@```c
    ;;@`  ch395_reset_all();
    ;;@`  ; Wait a bit
    ;;@```
.endproc

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
