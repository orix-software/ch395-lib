.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif    

.importzp ptr1

.import popax

.export _ch395_set_ip_addr_sn

; void ch395_set_ip_addr_sn(unsigned char ip_addr[],unsigned char ID_SOCKET)

.proc _ch395_set_ip_addr_sn
    ldx     #CH395_SET_IP_ADDR_SN
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    jsr     popax ; get ip_addr
    
    sta     ptr1
    stx     ptr1+1
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
