.ifndef CH395_COMMAND_PORT
    .include "../include/ch395.inc"
.endif    

.export _ch395_get_ip_inf

.importzp ptr1

.proc _ch395_get_ip_inf
    sta     ptr1
    stx     ptr1+1

	lda     #CH395_GET_IP_INF
    sta     CH395_COMMAND_PORT 


    ldy     #$00
@loop:
    lda     CH395_DATA_PORT
    sta     (ptr1),y
    iny
    cpy     #20
    bne     @loop

    rts
.endproc
