.include "ch395.inc"


.export _ch395_set_ipraw_pro_sn
.import ch395_set_ipraw_pro_sn

.proc _ch395_set_ipraw_pro_sn
    ;;@proto void          ch395_set_ipraw_pro_sn(unsigned char ID_SOCKET);
    ;;@brief Set ipraw protocol on socket
    ;;@inputPARAM_socketid The socketid
    ; Send AX ?
    jmp     ch395_set_ipraw_pro_sn
.endproc

