.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.importzp ptr1
.import popax

.export _ch395_set_des_port_sn
.export ch395_set_des_port_sn


.proc ch395_set_des_port_sn
    sty     ptr1
    stx     ptr1+1

entry_point_c:
    ldy     #CH395_SET_DES_PORT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id

    lda     ptr1

    sta     CH395_DATA_PORT
    stx     CH395_DATA_PORT

    rts
.endproc

.proc _ch395_set_des_port_sn
    ;;@proto void          ch395_set_des_port_sn(unsigned int port, unsigned char ID_SOCKET);
    ;;@inputPARAM_socketid The socketid
    pha
    jsr     popax     ; get port
    sta     ptr1
    stx     ptr1+1
    pla

    jmp     ch395_set_des_port_sn::entry_point_c

.endproc
