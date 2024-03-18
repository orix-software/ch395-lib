.include "ch395.inc"

.export _ch395_get_recv_len_sn
.export ch395_get_recv_len_sn

.proc _ch395_get_recv_len_sn
    ;;@proto void ch395_get_recv_len_sn(unsigned char ID_SOCKET)
    ;;@brief Get the length received from socket
    ;;@inputPARAM_socketid The socketid
    ;;@```c
    ;;@`  length_received = ch395_get_recv_len_sn(1);
    ;;@```
.endproc

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
