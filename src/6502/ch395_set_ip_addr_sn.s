.include "ch395.inc"
.include "telestrat.inc"


.export ch395_set_ip_addr_sn

.proc ch395_set_ip_addr_sn
    ;;@brief Set Socket Ip address to connect with
    ;;@inputA Socket id

    sty     RES
    stx     RES+1

entry_point_c:
    ldx     #CH395_SET_IP_ADDR_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    ; send IP
    ldy     #$00
@loop:
    lda     (RES),y
    sta     CH395_DATA_PORT
    iny
    cpy     #04
    bne     @loop

    rts
.endproc
