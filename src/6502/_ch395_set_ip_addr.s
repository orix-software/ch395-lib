.include "ch395.inc"

.export _ch395_set_ip_addr
.export ch395_set_ip_addr

.import popax

.proc _ch395_set_ip_addr
    ;;@brief Set ip addr
.endproc

.proc ch395_set_ip_addr
    ;;@brief Set ip row
	lda     #CH395_SET_IP_ADDR
    rts
.endproc
