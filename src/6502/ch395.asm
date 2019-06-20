
.include "ch395.inc"

.proc _ch395_reset_all
    lda #CH395_RESET_ALL
    rts
.endproc

.proc _ch395_set_mac_adress
    rts
.endproc

.proc _ch395_dhcp_enable
   lda #CH395_DHCP_ENABLE
   rts
.endproc 

