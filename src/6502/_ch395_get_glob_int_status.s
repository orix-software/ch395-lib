.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_get_glob_int_status
.export ch395_get_glob_int_status

.proc _ch395_get_glob_int_status
    ;;@proto unsigned int ch395_get_glob_int_status();
    ;;@brief Get General interrupt Status
    ;;@```c
    ;;@`  val = ch395_get_glob_int_status();
    ;;@`  // check val to get interrupts states
    ;;@```
.endproc

.proc ch395_get_glob_int_status
    ;;@brief Get General interrupt Status
    ;;@modifyA
    ;;@```ca65
    ;;@`  jsr       ch395_get_glob_int_status
    ;;@`  ; check accumulator to get interrupts states
    ;;@```
	lda     #CH395_GET_GLOB_INT_STATUS
    sta     CH395_COMMAND_PORT
    lda     CH395_DATA_PORT
    rts
.endproc
