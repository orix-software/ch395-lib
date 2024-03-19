.include "ch395.inc"

.importzp ptr1
.import popax

.export _ch395_set_ip_addr_sn
.import ch395_set_ip_addr_sn

.proc _ch395_set_ip_addr_sn
    ;;@proto void ch395_set_ip_addr_sn(unsigned char ip_addr[], unsigned char ID_SOCKET)
    ;;@bried Set ip addr socket
    pha
    jsr     popax ; get ip_addr
    sta     ptr1
    stx     ptr1+1
    pla
;    jmp     ch395_set_ip_addr_sn::entry_point_c
.endproc
