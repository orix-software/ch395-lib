.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.ifndef FROM_ASSEMBLY
    .importzp ptr1
    .import popax
.endif

; _ch395_get_remot_ipp_sn(unsigned char *ptr, unsigned char socket)

.export _ch395_get_remot_ipp_sn

.proc _ch395_get_remot_ipp_sn

.ifdef FROM_ASSEMBLY
    sty     ptr1
    stx     ptr1+1
.else

.endif

    ldy     #CH395_GET_REMOT_IPP_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT

.ifdef FROM_ASSEMBLY
.else
    jsr     popax
    sta     ptr1
    stx     ptr1+1
.endif

    ldy     #$00
@loop:

    lda     CH395_DATA_PORT
    sta     (ptr1),y

    iny
    cpy     #$06
    bne     @loop

    rts
.endproc
