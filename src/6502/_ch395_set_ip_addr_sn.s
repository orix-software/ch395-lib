.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.ifndef ptr1
    .importzp ptr1
.endif

.ifndef      FROM_ASSEMBLY
    .import popax
.endif

.export _ch395_set_ip_addr_sn

; void ch395_set_ip_addr_sn(unsigned char ip_addr[],unsigned char ID_SOCKET)

.proc _ch395_set_ip_addr_sn

.ifdef      FROM_ASSEMBLY
    sty     ptr1
    stx     ptr1+1
.else

.endif

    ldx     #CH395_SET_IP_ADDR_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id

.ifdef      FROM_ASSEMBLY
.else
    jsr     popax ; get ip_addr
    sta     ptr1
    stx     ptr1+1
.endif

    ; send IP
    ldy     #$00
@loop:
    lda     (ptr1),y
    sta     CH395_DATA_PORT
    iny
    cpy     #04
    bne     @loop

    rts
.endproc
