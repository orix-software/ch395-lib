.include "../include/ch395.inc"

.export _ch395_get_int_status_sn
.import ch395_get_int_status_sn

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
    jmp     ch395_get_int_status_sn
.endproc

