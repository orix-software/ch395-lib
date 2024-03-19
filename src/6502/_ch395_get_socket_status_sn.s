.include "ch395.inc"

.export _ch395_get_socket_status_sn
.import ch395_get_socket_status_sn

.proc _ch395_get_socket_status_sn
    ;;@proto unsigned int ch395_get_socket_status_sn(unsigned char ID_SOCKET);
    ;;@brief Returns in A socket status (close/open ... )
    ;;@inputPARAM_socketid The socketid
    jmp     ch395_get_socket_status_sn
.endproc
