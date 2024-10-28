.include "ch395.inc"
.include "telestrat.inc"

.export ch395_set_des_port_sn

.proc ch395_set_des_port_sn
    ;;@brief This command is used to set the Socket destination port. It is necessary to input 1 byte of Socket index value and 2 bytes of destination port (the low bytes are in front). When Socket works in UDP or TCP Client mode, this value must be set.
    ;;@inputA Socketid
    ;;@inputY Low int
    ;;@inputX high int
    ;;@modifyMEM_RES tmp
    ;;@```ca65
    ;;@`  lda  #$01
    ;;@`  ldy  #80
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
