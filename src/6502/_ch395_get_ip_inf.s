.include "ch395.inc"

.include "telestrat.inc"

.export _ch395_get_ip_inf
.import ch395_get_ip_inf

.proc _ch395_get_ip_inf
    ;;@proto void          ch395_get_ip_inf(unsigned char ip_infos[]);
    ;;@brief Get ip info : ip_infos must be 20 bytes length)
    jmp     ch395_get_ip_inf
.endproc
