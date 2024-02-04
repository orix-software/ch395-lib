.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif


    .importzp ptr1
    .import popax


.export _ch395_get_remot_ipp_sn
.export ch395_get_remot_ipp_sn


.proc ch395_get_remot_ipp_sn
    ;;@brief Get remote ip connected to the socket
    ;;@inputA The Socket for the ip to get
    ;;@inputX The ptr (high) to store the ip
    ;;@inputY The ptr (low) to store the ip
    ;;@modifyA
    ;;@modifyX
    ;;@modifyY

    sty     ptr1
    stx     ptr1+1

enter_c_proto:
    ldy     #CH395_GET_REMOT_IPP_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT

    ldy     #$00

@loop:
    lda     CH395_DATA_PORT
    sta     (ptr1),y

    iny
    cpy     #$06
    bne     @loop

    rts
.endproc


.proc _ch395_get_remot_ipp_sn
    ;;@proto void          ch395_get_remot_ipp_sn(unsigned char *ptr, unsigned char socket);
    ;;@brief Get remote ip connected to the socket

    pha
    jsr     popax
    sta     ptr1
    stx     ptr1+1
    pla
    jmp     ch395_get_remot_ipp_sn::enter_c_proto
.endproc

