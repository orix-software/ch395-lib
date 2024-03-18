
.include "ch395.inc"

.import popax
.importzp ptr1, ptr2

.export _ch395_read_recv_buf_sn
.import ch395_read_recv_buf_sn


.proc _ch395_read_recv_buf_sn
    ;;@proto void          ch395_read_recv_buf_sn(unsigned char *buffer, unsigned int ptr2,unsigned char ID_SOCKET);
    ;;@inputPARAM_socketid The socketid
    jsr     popax
    tax
    stx     ptr2+1
    jmp     ch395_read_recv_buf_sn
.endproc
