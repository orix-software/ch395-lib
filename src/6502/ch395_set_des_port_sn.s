.include "ch395.inc"
.include "telestrat.inc"

.export ch395_set_des_port_sn

.proc ch395_set_des_port_sn
    ;;@brief Set dest port socket
    ;;@inputA Socketid
    ;;@inputY Low int
    ;;@inputX high int
    ;;@modifyMEM_RES tmp
    ;;@```ca65
    ;;@`  lda  #$01
    ;;@`  ldx  #80
    ;;@`  ldx  #$00
    ;;@`  jsr ch395_set_des_port_sn
    ;;@`  rts
    ;;@```
    sty     RES

entry_point_c:
    ldy     #CH395_SET_DES_PORT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id

    lda     RES

    sta     CH395_DATA_PORT
    stx     CH395_DATA_PORT

    rts
.endproc
