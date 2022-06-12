
.ifndef CH395_COMMAND_PORT
    .include "../include/ch395.inc"
.endif

.export _ch395_get_socket_status_sn

; unsigned int ch395_get_socket_status_sn(unsigned char ID_SOCKET);

.proc _ch395_get_socket_status_sn
	ldx     #CH395_GET_SOCKET_STATUS_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
    ldx     CH395_DATA_PORT
    rts
.endproc

