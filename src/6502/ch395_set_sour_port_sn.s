.include "ch395.inc"
.include "telestrat.inc"

.export ch395_set_sour_port_sn

.proc ch395_set_sour_port_sn
    ;;@brief Set source port
    ;;@inputA Socket id
    ;;@inputY Low ptr address
    ;;@inputX High ptr address
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
