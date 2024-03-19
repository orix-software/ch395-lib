.include "ch395.inc"

.export _ch395_tcp_connect_sn
.import ch395_tcp_connect_sn

.proc _ch395_tcp_connect_sn
    ;;@proto void ch395_tcp_connect_sn(unsigned char ID_SOCKET)
    ;;@inputPARAM_socketid The socketid
    jmp     ch395_tcp_connect_sn
.endproc

