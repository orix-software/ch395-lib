.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif    

.import popax

.importzp ptr1

.export _ch395_read_recv_buf_sn
; void ch395_read_recv_buf_sn(unsigned char *buffer, unsigned int length,unsigned char ID_SOCKET)
.proc _ch395_read_recv_buf_sn
   ; rts
    ldy     #CH395_READ_RECV_BUF_SN
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
    lda     CH395_DATA_PORT ; set length
    sta     (ptr1),y

    iny
    dec     length
    bne     @loop
@exit:    
    rts

    lda     length+1
    beq     @exit
    dec     length+1
    jmp     @exit

    
length:
    .res 2


.endproc