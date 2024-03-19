.include "ch395.inc"
.include "telestrat.inc"

.export _ch395_get_mac_adress
.import ch395_get_mac_adress

.proc _ch395_get_mac_adress
    ;;@proto void          ch395_get_mac_adress(unsigned char macaddress[]);
    ;;@brief Get mac address
    jmp     ch395_get_mac_adress
.endproc
