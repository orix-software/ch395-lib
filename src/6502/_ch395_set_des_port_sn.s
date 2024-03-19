.include "ch395.inc"

.importzp ptr1
.import popax

.export _ch395_set_des_port_sn
.import ch395_set_des_port_sn


.proc _ch395_set_des_port_sn
    ;;@proto void          ch395_set_des_port_sn(unsigned int port, unsigned char ID_SOCKET);
    ;;@brief Set dest port socket
    ;;@inputPARAM_socketid The socketid
    pha
    jsr     popax     ; get port
    sta     ptr1
    stx     ptr1+1
    pla
; FIXME
;    jmp     ch395_set_des_port_sn::entry_point_c

.endproc
