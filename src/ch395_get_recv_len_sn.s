.include "ch395.inc"

.export ch395_get_recv_len_sn

.proc ch395_get_recv_len_sn
    ;;@brief Get the length received from socket
    ;;@inputA Socket id
    ;;@```ca65
    ;;@`  lda #$01 ; Socket 1
    ;;@`  jsr ch395_get_recv_len_sn
    ;;@`  ; check A and X for length received
    ;;@`ch395_connected:
    ;;@```
    ;;@modifyA
    ;;@modifyX
    ;;@returnsA The length
    ;;@returnsX The length
    ldx     #CH395_GET_RECV_LEN_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; send socket
    lda     CH395_DATA_PORT ; get length
    ldx     CH395_DATA_PORT ; get length
    rts
.endproc
