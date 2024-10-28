.include "ch395.inc"

.export ch395_open_socket_sn

.proc ch395_open_socket_sn
    ;;@brief This command is used to open Socket and use the necessary steps of Socket. It is necessary to input 1 byte of Socket index value. After sending this command, MCU shall send GET_CMD_STATUS to query the command execution status. After opening Socket in UDP, IPRAW or MACRAW mode and returning successfully, data transmission can be performed. Before this command is sent, necessary settings must be made for destination IP, protocol type, source port, destination port, etc. Please refer to 8.3 Application Reference Steps for detailed steps.
    ;;@inputA Socket id
    ;;@modifyY
    ldy     #CH395_OPEN_SOCKET_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    rts
.endproc
