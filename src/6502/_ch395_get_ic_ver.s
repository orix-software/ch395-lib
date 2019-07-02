
.include "../include/ch395.inc"

.export _ch395_get_ic_ver

.proc _ch395_get_ic_ver
	lda #CH395_GET_IC_VER
    rts
.endproc

