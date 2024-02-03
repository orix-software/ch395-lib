
.ifndef CH395_COMMAND_PORT
    .include "../include/ch395.inc"
.endif

.export _ch395_get_ic_ver
.export ch395_get_ic_ver

.proc _ch395_get_ic_ver
    ;;@brief Get ch395 firmware version
.endproc

.proc ch395_get_ic_ver
    ;;@brief Get ch395 firmware version
	lda     #CH395_GET_IC_VER
    sta     CH395_COMMAND_PORT
    lda     CH395_DATA_PORT
    rts
.endproc
