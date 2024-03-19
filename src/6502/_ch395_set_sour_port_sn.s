.include "ch395.inc"

.import popax
.importzp ptr1

.export _ch395_set_sour_port_sn
.import ch395_set_sour_port_sn

.proc _ch395_set_sour_port_sn
    ;;@proto void ch395_set_sour_port_sn(unsigned int port,unsigned char ID_SOCKET)
    ;;@brief Set source socket
    ;;@inputPARAM_socketid The socketid
    ;;@```c
    ;;@`  ch395_set_sour_port_sn(50000,1);
    ;;@`
    ;;@```
    pha
    jsr     popax     ; get port
    tay
    pla
    jmp     ch395_set_sour_port_sn
.endproc
