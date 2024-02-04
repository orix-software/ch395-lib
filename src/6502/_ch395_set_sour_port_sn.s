.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.ifndef      FROM_ASSEMBLY
    .import popax
.endif

.export _ch395_set_sour_port_sn
.export ch395_set_sour_port_sn

.proc _ch395_set_sour_port_sn
    ;;@proto void ch395_set_sour_port_sn(unsigned int port,unsigned char ID_SOCKET)


    jsr     popax     ; get port

.endproc

.proc ch395_set_sour_port_sn
    sty     ptr1
    ; keep X for next call
    ldy     #CH395_SET_SOUR_PORT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id

    lda     ptr1

    sta     CH395_DATA_PORT
    stx     CH395_DATA_PORT
    rts
.endproc
