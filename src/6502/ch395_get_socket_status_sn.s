.include "ch395.inc"

.export ch395_get_socket_status_sn

.proc ch395_get_socket_status_sn
    ;;@brief Returns in A socket status (close/open ...)
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

