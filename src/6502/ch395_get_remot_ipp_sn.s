.include "ch395.inc"
.include "telestrat.inc"

.export ch395_get_remot_ipp_sn

.proc ch395_get_remot_ipp_sn
    ;;@brief Get remote ip connected to the socket
    ;;@inputA The Socket for the ip to get
    ;;@inputX The ptr (high) to store the ip
    ;;@inputY The ptr (low) to store the ip
    ;;@modifyA
    ;;@modifyX
    ;;@modifyY
    ;;@modifyMEM_RES
    ;;@```ca65
    ;;@`  lda     #$01 ; Socket 1
    ;;@`  ldx     #<ip_dest
    ;;@`  ldy     #>ip_dest
    ;;@`  jsr     ch395_get_remot_ipp_sn
    ;;@`  rts
    ;;@`ipdest:
    ;;@`  .byte 192,168,0,1
    ;;@```

    sty     RES
    stx     RES+1

enter_c_proto:
    ldy     #CH395_GET_REMOT_IPP_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT

    ldy     #$00

@loop:
    lda     CH395_DATA_PORT
    sta     (RES),y

    iny
    cpy     #$06
    bne     @loop

    rts
.endproc



