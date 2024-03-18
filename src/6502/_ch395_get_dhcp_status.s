.include "ch395.inc"

.export _ch395_get_dhcp_status
.import ch395_get_dhcp_status

.proc _ch395_get_dhcp_status
   ;;@proto unsigned char ch395_get_dhcp_status();
   ;;@```c
   ;;@`  val = ch395_get_dhcp_status;
   ;;@```
   ;;@brief Get dhcp status
   jmp      ch395_get_dhcp_status
.endproc

