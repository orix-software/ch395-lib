.include "ch395.inc"
.include "telestrat.inc"

.export _ch395_get_mac_adress
.export ch395_get_mac_adress

.proc _ch395_get_mac_adress
    ;;@proto void          ch395_get_mac_adress(unsigned char macaddress[]);
    ;;@brief Get mac address
.endproc

.proc ch395_get_mac_adress
    ;;@brief Get mac address
    ;;@inputA the ptr
    ;;@inputX the ptr
    ;;@modifyA
    ;;@modifyX
    ;;@modifyY
    ;;@modifyMEM_RES Tmp value
    ;;@returnsA the content of ptr modified
    ;;@returnsX the content of ptr modified
    sta     RES
    stx     RES+1
	lda     #CH395_GET_MAC_ADDR
    sta     CH395_COMMAND_PORT

    ldy     #$00

@loop:
    lda     CH395_DATA_PORT
    sta     (RES),y

    iny
    cpy     #$06
    bne     @loop

    rts
.endproc
