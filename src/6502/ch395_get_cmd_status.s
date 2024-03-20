.include "ch395.inc"

.export ch395_get_cmd_status

.proc ch395_get_cmd_status
    ;;@brief This command is used to get the command execution status. CH395 will output 1 byte of data, which is the command execution state. The command execution status is as follows:
    ;;Code Name Description
    ;;00H CH395_ERR_SUCCESS Success
    ;;10H CH395_ERR_BUSY Busy, the command is being executed
    ;;11H CH395_ERR_MEM Memory Management error
    ;;12H CH395_ERR_BUF Buffer error
    ;;13H CH395_ERR_TIMEOUT Timeout
    ;;14H CH395_ERR_RTE Route error
    ;;15H CH395_ERR_ABRT Connection suspended
    ;;16H CH395_ERR_RST Connection reset
    ;;17H CH395_ERR_CLSD Connection closed
    ;;18H CH395_ERR_CONN No connection
    ;;19H CH395_ERR_VAL Value error
    ;;1AH CH395_ERR_ARG Parameter error
    ;;1BH CH395_ERR_USE Used
    ;;1CH CH395_ERR_IF MAC error
    ;;1DH CH395_ERR_ISCONN Connected
    ;;20H CH395_ERR_OPEN Opened
    ;;If MCU receives CH395_ERR_BUSY, indicating that CH395 is executing the command, MCU shall delay
    ;;more than 2 milliseconds and send the command CMD_GET_CMD_STATUS again to get the status.
    ;;For the commands marked in gray of the command code table, it is necessary to send
    ;;CMD_GET_CMD_STATUS to get the execution status
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
