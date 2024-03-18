.include "ch395.inc"

.export ch395_set_proto_type_sn

.proc ch395_set_proto_type_sn
    ;;@inputA Socket id
    ldy     #CH395_SET_PROTO_TYPE_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    stx     CH395_DATA_PORT ; tcp mode
    rts
.endproc
