.include "ch395.inc"

.import popax

.export _ch395_set_ip_addr_sn
.import ch395_set_ip_addr_sn

.proc _ch395_set_ip_addr_sn
    ;;@proto void ch395_set_ip_addr_sn(unsigned char ip_addr[], unsigned char ID_SOCKET)
    ;;@bried Set ip addr socket
    pha
    jsr     popax ; get ip_addr
    tay
    pla
    jmp     ch395_set_ip_addr_sn
.endproc
