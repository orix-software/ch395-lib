.include "ch395.inc"

.export ch395_init

.proc ch395_init
    ;;@brief Initialize ch395
    ;;@modifyA
    ;;@brief Reset ch395
    ;;@```ca65
    ;;@`  jsr       ch395_init
    ;;@`  ; Wait a bit
    ;;@```
	lda     #CH395_INIT
    sta     CH395_COMMAND_PORT
    rts
.endproc
