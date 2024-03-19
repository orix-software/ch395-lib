.include "ch395.inc"

.export ch395_get_phy_status

.proc ch395_get_phy_status
    ;;@brief Get physical status
    ;;@modifyA
    ;;@returnsA The physical status
    ;;@```ca65
    ;;@`  jsr ch395_get_phy_status
    ;;@`  ; Check A physical status
    ;;@`  rts
    ;;@```
	lda     #CH395_GET_PHY_STATUS
    sta     CH395_COMMAND_PORT
    lda     CH395_DATA_PORT
    rts
.endproc