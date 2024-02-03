.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.ifndef ptr1
    .importzp ptr1
.endif

.export _ch395_get_mac_adress

.proc _ch395_get_mac_adress
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
