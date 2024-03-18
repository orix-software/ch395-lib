.include "ch395.inc"

.export ch395_get_ic_ver

.proc ch395_get_ic_ver
    ;;@brief Get ch395 firmware version
    ;;@modifyA
    ;;@returnsA Version
    ;;@```ca65
    ;;@`  jsr ch395_get_ic_ver
    ;;@`  ; Check A for version
    ;;@`  rts
    ;;@```

	lda     #CH395_GET_IC_VER
    sta     CH395_COMMAND_PORT
    lda     CH395_DATA_PORT
    rts
.endproc
