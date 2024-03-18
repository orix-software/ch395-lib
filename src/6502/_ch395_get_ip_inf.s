.include "ch395.inc"

.include "telestrat.inc"

.export _ch395_get_ip_inf
.export ch395_get_ip_inf

.proc _ch395_get_ip_inf
    ;;@proto void          ch395_get_ip_inf(unsigned char ip_infos[]);
    ;;@brief Get ip info
.endproc

.proc ch395_get_ip_inf
    ;;@brief Get ip info
    ;;@inputA the ptr to modify
    ;;@inputX the ptr to modify
    ;;@modifyA
    ;;@modifyX
    ;;@modifyY
    ;;@modifyMEM_RES Tmp value
    sta     RES
    stx     RES+1

	lda     #CH395_GET_IP_INF
    sta     CH395_COMMAND_PORT

    ldy     #$00

@loop:
    lda     CH395_DATA_PORT
    sta     (RES),y
    iny
    cpy     #20
    bne     @loop

    rts
.endproc
