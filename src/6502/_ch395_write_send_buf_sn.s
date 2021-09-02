.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif    

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
@exit:    
    rts
    lda     length+1
    beq     @exit
    dec     length+1
    jmp     @exit
    

    rts
length:
    .res 2


.endproc