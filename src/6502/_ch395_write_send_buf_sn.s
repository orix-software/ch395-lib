.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif


.ifndef      FROM_ASSEMBLY
    .import popax
    .importzp ptr1
.endif

.export _ch395_write_send_buf_sn

; void ch395_write_send_buf_sn(unsigned char *msg, unsigned int length,unsigned char ID_SOCKET)

.proc _ch395_write_send_buf_sn

.ifdef      FROM_ASSEMBLY
    sty     length
    stx     length+1
.endif

    ldy     #CH395_WRITE_SEND_BUF_SN
    sty     CH395_COMMAND_PORT

    sta     CH395_DATA_PORT

.ifdef      FROM_ASSEMBLY
    lda     length
    ldx     length+1
.else
    jsr     popax
    sta     length
    stx     length+1
.endif
    sta     CH395_DATA_PORT ; set length
    stx     CH395_DATA_PORT ; set length


; In assembly ptr1 is already set
.ifdef      FROM_ASSEMBLY
.else
    jsr     popax
    sta     ptr1
    stx     ptr1+1
.endif

@restart:
    ldy     #$00
@loop:
    lda     (ptr1),y
    sta     CH395_DATA_PORT
    iny
    cpy     length
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