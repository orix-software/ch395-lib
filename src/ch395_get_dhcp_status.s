.include "ch395.inc"

.export ch395_get_dhcp_status

.proc ch395_get_dhcp_status
    ;;@brief Get dhcp status
    ;;@```ca65
    ;;@`  jsr ch395_get_dhcp_status
    ;;@`  ; Check A for dhcp status
    ;;@`  rts
    ;;@```
    ;;@modifyA
   lda     #CH395_GET_DHCP_STATUS
   sta     CH395_COMMAND_PORT
   lda     CH395_DATA_PORT
   rts
.endproc
