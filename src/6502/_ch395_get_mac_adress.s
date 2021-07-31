
.include "ch395.inc"

.importzp ptr1

.export _ch395_get_mac_adress

.proc _ch395_get_mac_adress
    sta     ptr1
    stx     ptr1+1
	lda     #CH395_GET_MAC_ADDR
    sta     CH395_COMMAND_PORT
    ldy     #$00
    ; 0 $84
    lda     CH395_DATA_PORT
    sta     (ptr1),y
    iny
    ; 1 $c2
    lda     CH395_DATA_PORT
    sta     (ptr1),y
    iny
    ; 2 $e4

    lda     CH395_DATA_PORT
    sta     (ptr1),y
    iny
    ; 3 $ef ?
    lda     CH395_DATA_PORT
    sta     (ptr1),y
    iny
    ; 4 0f ?
    lda     CH395_DATA_PORT
    sta     (ptr1),y
    iny

    ; $0d ?

    lda     CH395_DATA_PORT
    sta     (ptr1),y



    rts
.endproc

