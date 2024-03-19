.include "ch395.inc"

.export ch395_set_ip_addr

.proc ch395_set_ip_addr
    ;;@brief Set ip row
	lda     #CH395_SET_IP_ADDR
    rts
.endproc
