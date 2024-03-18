.include "ch395.inc"


.export _ch395_set_ipraw_pro_sn
.export ch395_set_ipraw_pro_sn

.proc _ch395_set_ipraw_pro_sn
    ;;@proto void          ch395_set_ipraw_pro_sn(unsigned char ID_SOCKET);
    ;;@brief Set ipraw protocol on socket
    ;;@inputPARAM_socketid The socketid
.endproc

.proc ch395_set_ipraw_pro_sn
    ;;@brief Set ipraw protocol on socket
    ;;@inputA Socket id
    ;;@inputX the mode proto
    ;;@modifyY
    ldy     #CH395_SET_IPRAW_PRO_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Set socket port
    stx     CH395_DATA_PORT

    rts
.endproc
