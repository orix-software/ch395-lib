.include "ch395.inc"

.export ch395_get_phy_status

.proc ch395_get_phy_status
    ;;@brief This command is used to get PHY connection status. After receiving this command, CH395 will query the current PHY connection status and output 1-byte PHY connection status code: PHY is disconnected when the connection status code is 01H; PHY connection is 10M full duplex when the connection status code is 02H; PHY connection is 10M half duplex when the connection status code is 04H. PHY connection is 100M full duplex when the connection status code is 08H; PHY connection is 100M half duplex when the connection status code is 10H

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
