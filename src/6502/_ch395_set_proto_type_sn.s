.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.import popa

.export _ch395_set_proto_type_sn
.export ch395_set_proto_type_sn

.proc _ch395_set_proto_type_sn
    ;;@proto void ch395_set_proto_type_sn(unsigned char proto,unsigned char ID_SOCKET)
    ;;@inputPARAM_socketid The socketid
    pha
    jsr     popa
    tax
    pla
.endproc

.proc ch395_set_proto_type_sn
    ldy     #CH395_SET_PROTO_TYPE_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    stx     CH395_DATA_PORT ; tcp mode
    rts
.endproc
