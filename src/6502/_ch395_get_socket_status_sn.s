
.ifndef CH395_COMMAND_PORT
    .include "../include/ch395.inc"
.endif

.export _ch395_get_socket_status_sn
.export ch395_get_socket_status_sn

.proc _ch395_get_socket_status_sn
    ;;@proto unsigned int ch395_get_socket_status_sn(unsigned char ID_SOCKET);
.endproc

.proc ch395_get_socket_status_sn
    ;;@brief Returns in A socket status (close/open)
    ; X : the TCP state
    ;;@modifyX
    ;;@modifyA
    ldx     #CH395_GET_SOCKET_STATUS_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
    ldx     CH395_DATA_PORT
    rts
.endproc

