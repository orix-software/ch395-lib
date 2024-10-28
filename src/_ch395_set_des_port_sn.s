.include "ch395.inc"

.import popax

.export _ch395_set_des_port_sn
.import ch395_set_des_port_sn

.proc _ch395_set_des_port_sn
    ;;@proto void          ch395_set_des_port_sn(unsigned int port, unsigned char ID_SOCKET);
    ;;@brief Set dest port socket
    ;;@inputPARAM_socketid The socketid
    pha
    jsr     popax     ; get port
    tay
    pla
    jmp     ch395_set_des_port_sn
.endproc
