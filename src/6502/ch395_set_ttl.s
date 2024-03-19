.include "ch395.inc"

.export ch395_set_ttl

.proc ch395_set_ttl
    ;;@brief This command is used to set Socket TTL. It is necessary to input 1 byte of Socket index value and 1 byte of TTL value. It shall be set after the Socket is opened, and the maximum value is 128
    ;;@inputA Socket ID
    ;;@inputX TTL value
    ldy     #CH395_SET_TTL
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    stx     CH395_DATA_PORT ; Send TTL value
    rts
.endproc
