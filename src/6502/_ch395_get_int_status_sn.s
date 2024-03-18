.include "../include/ch395.inc"

.export _ch395_get_int_status_sn
.export ch395_get_int_status_sn

.proc _ch395_get_int_status_sn
    ;;@proto unsigned char ch395_get_int_status_sn(unsigned char ID_SOCKET);
    ;;@brief Check interrupt socket status
    ;;@inputPARAM_socketid The socketid
    ;;@```c
    ;;@`#include "ch395.h"
    ;;@`...
    ;;@`  ch395_get_int_status_sn(CH395_SOCKET1);
    ;;@`  ; Check interrupt type
    ;;@`  rts
    ;;@```

.endproc

.proc ch395_get_int_status_sn
    ;;@brief Check interrupt socket status
    ;;@inputA Socket id
    ;;@modifyA
    ;;@modifyX
    ;;@returnsA Status of selected socket
    ;;@```ca65
    ;;@`  lda     #CH395_SOCKET1 ; Check socket 1
    ;;@`  jsr     ch395_get_int_status_sn
    ;;@`  ; Check interrupt type
    ;;@`  and     #CH395_SINT_STAT_SEND_OK
    ;;@`  cmp     #CH395_SINT_STAT_SEND_OK
    ;;@`  beq     @send_ok
    ;;@`  rts
    ;;@```
	ldx     #CH395_GET_INT_STATUS_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
    rts
.endproc

