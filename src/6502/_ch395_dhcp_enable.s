.ifndef CH395_COMMAND_PORT
   .include "ch395.inc"
.endif   

.export _ch395_dhcp_enable

.proc _ch395_dhcp_enable
   ldx     #CH395_DHCP_ENABLE
   stx     CH395_COMMAND_PORT 
   sta     CH395_DATA_PORT        
   rts
.endproc 
