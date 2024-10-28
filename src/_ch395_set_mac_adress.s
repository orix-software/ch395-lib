.include "ch395.inc"

.export _ch395_set_mac_adress
.import ch395_set_mac_adress

.importzp ptr1

.proc _ch395_set_mac_adress
    ;;@proto void          ch395_set_mac_adress(unsigned char macaddress[]);
    jmp     ch395_set_mac_adress
.endproc

