.include "ch395.inc"

.export ch395_get_ic_ver

.proc ch395_get_ic_ver
    ;;@brief This command is used to get the chip and firmware versions. 1 byte of data returned is the version number, the bit 7 is 0, the bit 6 is 1, and the bits 5-0 are the version number. If the returned value is 41H, remove bits 7 and 6, and the version number will be 01H. It is called chip version in this text
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
