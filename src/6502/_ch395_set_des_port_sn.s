.include "ch395.inc"

.importzp ptr1
.import popax

.export _ch395_set_des_port_sn
; void ch395_set_des_port_sn(unsigned int port,unsigned char ID_SOCKET)
.proc _ch395_set_des_port_sn
    ldy     #CH395_SET_DES_PORT_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Send socket id
    jsr     popax     ; get port
    sta     CH395_DATA_PORT 
    stx     CH395_DATA_PORT 

    
    rts
.endproc