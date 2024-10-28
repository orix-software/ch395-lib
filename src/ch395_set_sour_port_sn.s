.include "ch395.inc"
.include "telestrat.inc"

.export ch395_set_sour_port_sn

.proc ch395_set_sour_port_sn
    ;;@brief This command is used to set the source port of Socket. It is necessary to input 1 byte of Socket index value and 2 bytes of source port (low bytes in front). If two or more Sockets are in the same mode, the source port numbers must not be the same. For example, Socket 0 is in UDP mode, the source port number is 600, and Socket 1 is also in UDP mode. The source port number 600 cannot be used again, otherwise it may cause the0 opening failure.
    ;;@inputA Socket id
    ;;@inputY Low port
    ;;@inputX High port
    ;;@modifyMEM_RES
    sty     RES
    ; keep X for next call
    ldy     #CH395_SET_SOUR_PORT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id

    lda     RES

    sta     CH395_DATA_PORT
    stx     CH395_DATA_PORT
    rts
.endproc
