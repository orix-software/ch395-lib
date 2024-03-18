.include "ch395.inc"

.export _ch395_clear_recv_buf_sn
.import ch395_clear_recv_buf_sn

.proc _ch395_clear_recv_buf_sn
    ;;@proto void ch395_clear_recv_buf_sn(unsigned char ID_SOCKET)
    ;;@brief This command is used to clear the Socket receive buffer. It is necessary to input 1 byte of Socket index value. Upon receiving this command, CH395 will reset the receiving length of this Socket, and the receiving pointer will point to the buffer head.
    ;;@```c
    ;;@`  ch395_clear_recv_buf_sn(CH395_SOCKET1);
    ;;@```
    jmp     ch395_clear_recv_buf_sn
.endproc
