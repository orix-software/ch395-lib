.ifndef CH395_COMMAND_PORT
    .include "../include/ch395.inc"
.endif

.export _ch395_init
.export ch395_init

.proc _ch395_init
    ;;@proto void          ch395_init();
    ;;@brief Initialize ch395
.endproc

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
