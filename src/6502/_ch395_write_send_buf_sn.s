.include "ch395.inc"

.import popax
.importzp ptr1, ptr2

.export _ch395_write_send_buf_sn
.export ch395_write_send_buf_sn

.proc ch395_write_send_buf_sn
    ;;@brief Send data to socketid
    ;;@inputA Socket ID
    ;;@inputY Low length
    ;;@inputX High length
    sty     ptr2 ; Length
    stx     ptr2+1


entry_point_c:
    ldy     #CH395_WRITE_SEND_BUF_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT

    lda     ptr2
    ldx     ptr2+1

    sta     CH395_DATA_PORT ; set length
    stx     CH395_DATA_PORT ; set length

@restart:
    ldy     #$00

@loop:
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

.proc _ch395_write_send_buf_sn
    ;;@proto void          ch395_write_send_buf_sn(unsigned char *buffer, unsigned int length,unsigned char ID_SOCKET);
    ;;@brief Send data to socketid
    ;;@inputPARAM_socketid The socketid
    jsr     popax
    sta     ptr2
    stx     ptr2+1
    jsr     popax
    sta     ptr1
    stx     ptr1+1
    jmp     ch395_write_send_buf_sn::entry_point_c
.endproc
