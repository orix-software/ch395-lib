.ifndef CH395_COMMAND_PORT
    .include "../include/ch395.inc"
.endif

.export _ch395_init
.export ch395_init

.proc _ch395_init
.endproc

.proc ch395_init
    ;;@modifyA
	lda     #CH395_INIT
    sta     CH395_COMMAND_PORT
    rts
.endproc
