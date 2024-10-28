.include "ch395.inc"

.export ch395_init

.proc ch395_init
    ;;@brief This command is used to initialize CH395, including initializing MAC, PHY and TCP/IP stack of CH395. Generally, it takes 350mS to execute the command. MCU can send GET_CMD_STATUS to query whether the execution has finished and the execution status.
    ;;@modifyA
    ;;@brief Reset ch395
    ;;@```ca65
    ;;@`  jsr       ch395_init
    ;;@`  ; Wait a bit
    ;;@```
	lda     #CH395_INIT
    sta     CH395_COMMAND_PORT
    rts
.endproc
