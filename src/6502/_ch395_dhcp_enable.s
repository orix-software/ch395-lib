
.include "ch395.inc"

.export _ch395_dhcp_enable

.proc _ch395_dhcp_enable
   lda #CH395_DHCP_ENABLE
   rts
.endproc 

