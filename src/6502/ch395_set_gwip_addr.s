.include "ch395.inc"

.export ch395_set_gwip_addr

.proc ch395_set_gwip_addr
    ;;@brief Set gateway ip addr
	lda #CH395_SET_GWIP_ADDR
    rts
.endproc
