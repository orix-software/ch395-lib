.include "ch395.inc"
.include "telestrat.inc"

.export ch395_write_send_buf_sn

.proc ch395_write_send_buf_sn
    ;;@brief Send data to socketid
    ;;@inputA Socket ID
    ;;@inputY Low length
    ;;@inputX High length
    ;;@inputMEM_RESB Adress ptr to read
    ;;@modifyMEM_RES Tmp
    sty     RES ; Length
    stx     RES+1

entry_point_c:
    ldy     #CH395_WRITE_SEND_BUF_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT

    lda     RES
    ldx     RES+1

    sta     CH395_DATA_PORT ; set length
    stx     CH395_DATA_PORT ; set length

@restart:
    ldy     #$00

@loop:
    lda     (RESB),y
    sta     CH395_DATA_PORT
    iny
    cpy     RES
    bne     @loop

@exit:
    rts
    lda     RES+1
    beq     @exit
    dec     RES+1
    jmp     @exit
    rts
.endproc
