.ifndef CH395_COMMAND_PORT
   .include "ch395.inc"
.endif

.export _ch395_get_dhcp_status
.export ch395_get_dhcp_status

.proc _ch395_get_dhcp_status
.endproc

.proc ch395_get_dhcp_status
    ;;@modifyA
   lda     #CH395_GET_DHCP_STATUS
   sta     CH395_COMMAND_PORT
   lda     CH395_DATA_PORT
   rts
.endproc
