.include "ch395.inc"

.importzp ptr1

.export _ch395_set_proto_type_sn
; void ch395_set_proto_type_sn(unsigned char proto,unsigned char ID_SOCKET)
.proc _ch395_set_proto_type_sn
    ldy     #CH395_SET_PROTO_TYPE_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    stx     CH395_DATA_PORT ; tcp mode
    
    rts
.endproc