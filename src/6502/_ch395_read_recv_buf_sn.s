.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.import popax
.importzp ptr1, ptr2

.export _ch395_read_recv_buf_sn
.export ch395_read_recv_buf_sn


.proc _ch395_read_recv_buf_sn
    ;;@proto void          ch395_read_recv_buf_sn(unsigned char *buffer, unsigned int ptr2,unsigned char ID_SOCKET);
    ;;@inputPARAM_socketid The socketid
    jsr     popax
    sta     ptr2
    stx     ptr2+1

.endproc

.proc ch395_read_recv_buf_sn
    ;;@inputA Socket id
    sty     ptr2
    stx     ptr2+1

    ldy     #CH395_READ_RECV_BUF_SN
    sty     CH395_COMMAND_PORT

    sta     CH395_DATA_PORT


    lda     ptr2
    ldx     ptr2+1

    sta     CH395_DATA_PORT ; set ptr2
    stx     CH395_DATA_PORT ; set ptr2

    lda     ptr2+1
    beq     @read_only_ptr2


@read_256_bytes:
    ldy     #$00

@loop2:
    lda     CH395_DATA_PORT ; set ptr2
    sta     (ptr1),y
    iny
    bne     @loop2

    inc     ptr1+1

    lda     ptr2+1
    cmp     #$01
    beq     @exit
    dec     ptr2+1
    jmp     @read_256_bytes

@exit:
    lda     ptr2
    beq     @go_rts
    jsr     @read_only_ptr2

@go_rts:
    rts

@read_only_ptr2:
    ldy     #$00
@loop:
    lda     CH395_DATA_PORT ; set ptr2
    sta     (ptr1),y
    iny
    cpy     ptr2
    bne     @loop
    rts

.endproc
