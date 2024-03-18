.include "ch395.inc"
.include "telestrat.inc"

.export ch395_read_recv_buf_sn

.proc ch395_read_recv_buf_sn
    ;;@brief Get buffer from socket
    ;;@inputA Socket id
    ;;@inputY Low ptr to fill
    ;;@inputX X ptr to fill
    ;;@modifyMEM_RES tmp value
    ;;@modifyMEM_RESB tmp value
    sty     RES
    stx     RES+1

    ldy     #CH395_READ_RECV_BUF_SN
    sty     CH395_COMMAND_PORT

    sta     CH395_DATA_PORT


    lda     RES
    ldx     RES+1

    sta     CH395_DATA_PORT ; set ptr2
    stx     CH395_DATA_PORT ; set ptr2

    lda     RES+1
    beq     @read_only_ptr2


@read_256_bytes:
    ldy     #$00

@loop2:
    lda     CH395_DATA_PORT ; set ptr2
    sta     (RESB),y
    iny
    bne     @loop2

    inc     RESB+1

    lda     RES+1
    cmp     #$01
    beq     @exit
    dec     RES+1
    jmp     @read_256_bytes

@exit:
    lda     RES
    beq     @go_rts
    jsr     @read_only_ptr2

@go_rts:
    rts

@read_only_ptr2:
    ldy     #$00
@loop:
    lda     CH395_DATA_PORT ; set ptr2
    sta     (RESB),y
    iny
    cpy     RES
    bne     @loop
    rts

.endproc
