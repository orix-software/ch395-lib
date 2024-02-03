.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_check_exist
.export ch395_check_exist

.proc _ch395_check_exist
    ;;@proto
.endproc

.proc ch395_check_exist
    ;;@brief Checks if ch395 exists
    ;;@modifyA
    ;;@returnsA Returns #AA if it exists
	lda     #CH395_CHECK_EXIST
    sta     CH395_COMMAND_PORT
    lda     #$55
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
    rts
.endproc
