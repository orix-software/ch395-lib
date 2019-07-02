
.include "ch395.inc"

.export _ch395_get_mac_adress

.proc _ch395_get_mac_adress
	lda #CH395_GET_MAC_ADDR
    rts
.endproc

