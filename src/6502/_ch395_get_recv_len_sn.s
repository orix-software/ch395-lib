.include "ch395.inc"

.export _ch395_get_recv_len_sn
.import ch395_get_recv_len_sn

.proc _ch395_get_recv_len_sn
    ;;@proto void ch395_get_recv_len_sn(unsigned char ID_SOCKET)
    ;;@brief Get the length received from socket
    ;;@inputPARAM_socketid The socketid
    ;;@```c
    ;;@`  length_received = ch395_get_recv_len_sn(1);
    ;;@```
    jmp     ch395_get_recv_len_sn
.endproc
