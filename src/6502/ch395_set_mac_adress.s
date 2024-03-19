.include "ch395.inc"
.include "telestrat.inc"

.export ch395_set_mac_adress

.proc ch395_set_mac_adress
    ;;@brief Set mac address
    ;;@inputA Low ptr mac adress
    ;;@inputX High ptr mac adress
    ;;@modifyA
    ;;@modifyY
    ;;@modifyMEM_RES
    ldy     #CH395_SET_MAC_ADDR
    sty     CH395_COMMAND_PORT
    sta     RES
    stx     RES+1

    ldy     #$00

@loop:
    lda     (RES),y
    sta     CH395_DATA_PORT
    iny
    cpy     #$06
    bne     @loop

    rts
.endproc
