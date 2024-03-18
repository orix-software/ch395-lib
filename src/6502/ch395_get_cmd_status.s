.include "ch395.inc"

.export ch395_get_cmd_status

.proc ch395_get_cmd_status
    ;;@brief Get cmd status
    ;;@```ca65
    ;;@`  jsr ch395_get_cmd_status
    ;;@`  ; Check A for STATUS
    ;;@`  rts
    ;;@```
    ;;@modifyA
	lda     #CH395_GET_CMD_STATUS
    sta     CH395_COMMAND_PORT
    lda     CH395_DATA_PORT
    rts
.endproc