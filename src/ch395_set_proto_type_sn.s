.include "ch395.inc"

.export ch395_set_proto_type_sn

.proc ch395_set_proto_type_sn
    ;;@brief This command is used to set the working mode of Socket. It is necessary to input 1 byte of Socket index value and 1 byte of working mode. The working mode is defined as follows:
    ;;@explain Code Name Description
    ;;@explain 03H PROTO_TYPE_TCP TCP mode
    ;;@explain 02H PROTO_TYPE_UDP UDP mode
    ;;@explain 01H PROTO_TYPE_MAC_RAW MAC original message mode
    ;;@explain 00H PROTO_TYPE_IP_RAW IP original message mode
    ;;@explain This command must be executed before CMD_OPEN_SOCKET_SN. Refer to 8.3 Application Reference
    ;;@explain Steps for detailed steps.
    ;;@inputA Socket id
    ;;@inputX Proto mode
    ;;@modifyY tmp
    ;;@```ca65
    ;;@`  lda       #$00 ; Socket
    ;;@`  ldx       #CH395_PROTO_TYPE_TCP
    ;;@`  jsr       ch395_set_proto_type_sn
    ;;@```
    ldy     #CH395_SET_PROTO_TYPE_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    stx     CH395_DATA_PORT ; tcp mode
    rts
.endproc
