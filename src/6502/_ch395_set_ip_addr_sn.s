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
.export ch395_set_ip_addr_sn

.proc _ch395_set_ip_addr_sn
    ;;@proto void ch395_set_ip_addr_sn(unsigned char ip_addr[], unsigned char ID_SOCKET)
    pha
    jsr     popax ; get ip_addr
    sta     ptr1
    stx     ptr1+1
    pla
    jmp     ch395_set_ip_addr_sn::entry_point_c
.endproc

.proc ch395_set_ip_addr_sn
    ;;@brief Set Socket Ip address to connect with


    sty     ptr1
    stx     ptr1+1

entry_point_c:
    ldx     #CH395_SET_IP_ADDR_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
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
