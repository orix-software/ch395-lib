.include "ch395.inc"

.export ch395_tcp_listen_sn

.proc ch395_tcp_listen_sn
    ;;@brief This command is only valid in TCP mode, enabling the Socket to be in the monitoring mode, namely, TCP Server mode. It is necessary to input a 1 byte of Socket index value. This command must be executed after OPEN_SOCKET_SN. After sending this command, MCU shall send GET_CMD_STATUS to query the 0command execution status. In TCP Server mode, the Socket will always detect connection events, and the interrupt SINT_STAT_CONNECT will be generated until the connection is successful. Only one connection can be 0established for each Socket. If an eligible connection event is received again, Socket will send TCP RESET to the remote end tried to be connected.
    ;;inputA SocketID
    ;;modifyY
    ldy     #CH395_TCP_LISTEN_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
