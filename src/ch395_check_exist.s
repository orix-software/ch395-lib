.include "ch395.inc"

.export ch395_check_exist

.proc ch395_check_exist
    ;;@brief This command is used to test the communication interface and working state to check whether CH395 is working properly. This command needs to input 1 byte of data, which can be any data. If CH395 is working properly, the output data of CH395 will be the bitwise reverse of the input data. For example, if the input data is 57H, the output data will be A8H.
    ;;@modifyA
    ;;@returnsA Returns '#CH395_DETECTED' if it exists
    ;;@```ca65
    ;;@`  jsr ch395_check_exist
    ;;@`  cmp       #CH395_DETECTED
    ;;@`  beq ch395_connected
    ;;@`  rts
    ;;@`ch395_connected:
    ;;@```
	lda     #CH395_CHECK_EXIST
    sta     CH395_COMMAND_PORT
    lda     #$55
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
    rts
.endproc
