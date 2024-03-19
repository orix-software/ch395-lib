.include "ch395.inc"

.export _ch395_set_ttl
.import ch395_set_ttl

.proc _ch395_set_ttl
    ;;@brief This command is used to set Socket TTL. It is necessary to input 1 byte of Socket index value and 1 byte of TTL value. It shall be set after the Socket is opened, and the maximum value is 128
    ;;@proto  ch395_set_ttl(unsigned char ID_SOCKET, unsigned char ttl_value);
    jmp     ch395_set_ttl
.endproc
