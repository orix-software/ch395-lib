
.include "ch395.inc"

.export _ch395_set_gwip_addr

.proc _ch395_set_gwip_addr
	lda #CH395_SET_GWIP_ADDR
    rts
.endproc

