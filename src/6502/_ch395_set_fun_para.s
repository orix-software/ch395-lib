.include "ch395.inc"

.export _ch395_set_fun_para
.export ch395_set_fun_para

.proc _ch395_set_fun_para
    ;;@proto void ch395_set_fun_para(unsigned char flag)
    ;;@brief Set fun para
.endproc

.proc ch395_set_fun_para
    ;;@brief Set fun para
    ;;@inputA Value
    ;;@modifyY
    ;;@modifyA
    ldy     #CH395_SET_FUN_PARA
    sty     CH395_COMMAND_PORT
    ; Send four bytes
    sta     CH395_DATA_PORT
    lda     #$00
    sta     CH395_DATA_PORT
    sta     CH395_DATA_PORT
    sta     CH395_DATA_PORT
    rts
.endproc
