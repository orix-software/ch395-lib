.include "ch395.inc"

.ifndef ptr1
    .importzp ptr1
.endif

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
    ;;@returnsA the content of ptr modified
    ;;@returnsX the content of ptr modified
    sta     ptr1
    stx     ptr1+1
	lda     #CH395_GET_MAC_ADDR
    sta     CH395_COMMAND_PORT

    ldy     #$00

@loop:
    lda     CH395_DATA_PORT
    sta     (ptr1),y

    iny
    cpy     #$06
    bne     @loop

    rts
.endproc
