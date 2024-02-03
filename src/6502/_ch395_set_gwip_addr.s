.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_set_gwip_addr
.export ch395_set_gwip_addr

.proc _ch395_set_gwip_addr
.endproc

.proc ch395_set_gwip_addr
	lda #CH395_SET_GWIP_ADDR
    rts
.endproc
