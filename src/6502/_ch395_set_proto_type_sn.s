.include "ch395.inc"

.import popa

.export _ch395_set_proto_type_sn
.import ch395_set_proto_type_sn

.proc _ch395_set_proto_type_sn
    ;;@proto void ch395_set_proto_type_sn(unsigned char proto, unsigned char ID_SOCKET)
    ;;@inputPARAM_socketid The socketid
    pha
    jsr     popa
    tax
    pla
    jmp     ch395_set_proto_type_sn
.endproc
