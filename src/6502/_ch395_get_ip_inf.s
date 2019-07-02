
.include "../include/ch395.inc"

.export _ch395_get_ip_inf

.proc _ch395_get_ip_inf
	lda #CH395_GET_IP_INF
    rts
.endproc

