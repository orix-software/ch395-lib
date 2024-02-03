
.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_set_mac_adress

.importzp ptr1

.proc _ch395_set_mac_adress
    ldy     #CH395_SET_MAC_ADDR
    sty     CH395_COMMAND_PORT
    sta     ptr1
    stx     ptr1+1

    ldy     #$00
@loop:
    lda     (ptr1),y
    sta     CH395_DATA_PORT
    iny
    cpy     #$06
    bne     @loop

    rts
.endproc
