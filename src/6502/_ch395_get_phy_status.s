.ifndef CH395_COMMAND_PORT
    .include "../include/ch395.inc"
.endif

.export _ch395_get_phy_status
.export ch395_get_phy_status

.proc _ch395_get_phy_status
.endproc

.proc ch395_get_phy_status
    ;;@modifyA
	lda     #CH395_GET_PHY_STATUS
    sta     CH395_COMMAND_PORT
    lda     CH395_DATA_PORT
    rts
.endproc
