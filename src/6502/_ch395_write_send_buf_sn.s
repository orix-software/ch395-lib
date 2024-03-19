.include "ch395.inc"
.include "telestrat.inc"

.import popax
.importzp ptr1, ptr2

.export _ch395_write_send_buf_sn
.import ch395_write_send_buf_sn

.proc _ch395_write_send_buf_sn
    ;;@proto void          ch395_write_send_buf_sn(unsigned char *buffer, unsigned int length,unsigned char ID_SOCKET);
    ;;@brief Send data to socketid [Not working]
    ;;@inputPARAM_socketid The socketid
    jsr     popax
    sta     ptr2
    stx     ptr2+1
    jsr     popax
    sta     RESB
    stx     RESB+1
    ;jmp     ch395_write_send_buf_sn::entry_point_c
.endproc
