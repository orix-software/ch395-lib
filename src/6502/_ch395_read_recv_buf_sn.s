.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.ifndef      FROM_ASSEMBLY
    .import popax
    .importzp ptr1
.endif

.export _ch395_read_recv_buf_sn
; void ch395_read_recv_buf_sn(unsigned char *buffer, unsigned int length,unsigned char ID_SOCKET)
.proc _ch395_read_recv_buf_sn

.ifdef      FROM_ASSEMBLY
    sty     length
    stx     length+1
.endif

    ldy     #CH395_READ_RECV_BUF_SN
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


.ifdef      FROM_ASSEMBLY
.else
    jsr     popax
    sta     ptr1
    stx     ptr1+1
.endif


@restart:
    ldy     #$00
@loop:
    lda     CH395_DATA_PORT ; set length
    sta     (ptr1),y

    iny
    cpy     length
    bne     @loop

    tya
    clc
    adc     ptr1
    bcc     @no_inc
    inc     ptr1+1
@no_inc:
    sta     ptr1

    lda     length+1
    beq     @exit
    dec     length+1
    lda     #$FF
    sta     length
    jmp     @restart
@exit:
    rts

length:
    .res 2
.endproc
