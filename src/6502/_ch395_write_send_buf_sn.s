.include "ch395.inc"

.import popax

.importzp ptr1

.export _ch395_write_send_buf_sn
; void ch395_write_send_buf_sn(unsigned char *msg, unsigned int length,unsigned char ID_SOCKET)
.proc _ch395_write_send_buf_sn
    ldy     #CH395_WRITE_SEND_BUF_SN
    sty     CH395_COMMAND_PORT

    sta     CH395_DATA_PORT

    jsr     popax

    sta     CH395_DATA_PORT ; set length
    sta     length
    stx     CH395_DATA_PORT ; set length
    stx     length+1

    jsr     popax
    sta     ptr1
    stx     ptr1+1

@restart:
    ldy     #$00
@loop:    
    lda     (ptr1),y
    sta     CH395_DATA_PORT ; set length
    iny
    dec     length
    bne     @loop
    ldy     #$00
    inc     ptr1+1
    dec     length+1
    bne     @restart

    rts
length:
    .res 2


.endproc