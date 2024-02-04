.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.import popax
.importzp ptr1,ptr2


.export _ch395_write_send_buf_sn
.export ch395_write_send_buf_sn

.proc _ch395_write_send_buf_sn
    ;;@proto
    jsr     popax
    sta     length
    stx     length+1
    jsr     popax
    sta     ptr1
    stx     ptr1+1

.endproc

.proc ch395_write_send_buf_sn
    ;;@inputA Socket ID
    sty     ptr2 ; Length
    stx     ptr2+1

    ldy     #CH395_WRITE_SEND_BUF_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT

    lda     ptr2
    ldx     ptr2+1

    sta     CH395_DATA_PORT ; set length
    stx     CH395_DATA_PORT ; set length

@restart:
    ldy     #$00

loop:
    lda     (ptr1),y
    sta     CH395_DATA_PORT
    iny
    cpy     ptr2
    bne     @loop

@exit:
    rts
    lda     ptr2+1
    beq     @exit
    dec     ptr2+1
    jmp     @exit
    rts
.endproc
