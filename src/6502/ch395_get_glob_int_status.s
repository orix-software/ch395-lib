.include "ch395.inc"

.export ch395_get_glob_int_status

.proc ch395_get_glob_int_status
    ;;@brief Get General interrupt Status
    ;;@modifyA
    ;;@returnsA Status
    ;;@```ca65
    ;;@`  jsr       ch395_get_glob_int_status
    ;;@`  ; check accumulator to get interrupts states
    ;;@```
	lda     #CH395_GET_GLOB_INT_STATUS
    sta     CH395_COMMAND_PORT
    lda     CH395_DATA_PORT
    rts
.endproc
