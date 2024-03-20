.include "ch395.inc"

.export ch395_set_ip_addr

.proc ch395_set_ip_addr
    ;;@brief This command is used to set IP address for CH395. It is necessary to input 4 bytes of IP address, with low bytes of IP in front. For all commands including IP input or output in this datasheet, IP low bytes are in front. This will not be explained below
    ;;@failure Does not work
	lda     #CH395_SET_IP_ADDR
    rts
.endproc
