.include "ch395.inc"

.export _ch395_open_socket_sn
.import ch395_open_socket_sn

.proc _ch395_open_socket_sn
    ;;@proto void ch395_open_socket_sn(unsigned char ID_SOCKET)
    ;;@inputPARAM_socketid The socketid
    jmp     ch395_open_socket_sn
.endproc
