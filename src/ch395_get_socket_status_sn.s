.include "ch395.inc"

.export ch395_get_socket_status_sn

.proc ch395_get_socket_status_sn
    ;;@brief This command is used to get Socket status. It is necessary to input a 1 byte of Socket index value. CH395 will output a 2-byte status code when receiving this command. The first status code is the status code of Socket. The status code of Socket is defined as follows:
    ;;Code Name
    ;;@explain 00H SOCKET_CLOSED
    ;;@explain 05H SOCKET_OPEN
    ;;@explain The second status code is TCP status code, which is only meaningful when TCP mode has been on. TCP
    ;;@explain status code is defined as follows:
    ;;@explain Code Name Description
    ;;@explain 00H TCP_CLOSED Closed
    ;;@explain 01H TCP_LISTEN Monitoring
    ;;@explain 02H TCP_SYN_SENT SYN sent
    ;;@explain 03H TCP_SYN_RCVD SYN received
    ;;@explain 04H TCP_ESTABLISHED TCP connection established
    ;;@explain 05H TCP_FIN_WAIT_1 The active closing side first sends FIN
    ;;@explain 06H TCP_FIN_WAIT_2 The active closing side receives an ACK from FIN
    ;;@explain 07H TCP_CLOSE_WAIT The passive closing side receives FIN
    ;;@explain 08H TCP_CLOSING Closing
    ;;@explain 09H TCP_LAST_ACK The passive closing side sends FIN
    ;;@explain 0AH TCP_TIME_WAIT 2MLS waiting status
    ;;@explain TCP status is defined in TCP/IP protocol. Please refer to TCP/IP protocol for the detailed meaning
    ;;@inputA Socket id
    ;;@modifyX
    ;;@modifyA
    ;;@returnsA The status
    ;;@returnsX The state
    ;;@```ca65
    ;;@`  lda #$01 ; Socket 1
    ;;@`  jsr ch395_get_socket_status_sn
    ;;@`  ; check A and X for the state
    ;;@`  cmp     #CH395_SOCKET_CLOSED
    ;;@`  beq @soclet is closed
    ;;@```
    ldx     #CH395_GET_SOCKET_STATUS_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
    ldx     CH395_DATA_PORT
    rts
.endproc

