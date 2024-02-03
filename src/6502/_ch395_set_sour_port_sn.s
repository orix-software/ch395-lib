.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.ifndef      FROM_ASSEMBLY
    .import popax
.endif

.export _ch395_set_sour_port_sn

; void ch395_set_sour_port_sn(unsigned int port,unsigned char ID_SOCKET)

.proc _ch395_set_sour_port_sn
.ifdef      FROM_ASSEMBLY

    sty     ptr1
    stx     ptr1+1
.else

.endif

    ldy     #CH395_SET_SOUR_PORT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id

.ifdef      FROM_ASSEMBLY
    lda     ptr1
    ldx     ptr1+1
.else
    jsr     popax     ; get port
.endif


    sta     CH395_DATA_PORT
    stx     CH395_DATA_PORT
    rts
.endproc
