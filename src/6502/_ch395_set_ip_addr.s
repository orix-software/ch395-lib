.include "ch395.inc"

.export _ch395_set_ip_addr
.import ch395_set_ip_addr

.import popax

.proc _ch395_set_ip_addr
    ;;@brief This command is used to set the destination IP address of Socket. It is necessary to input 1 byte of Socket index value and 4 bytes of destination IP address. When Socket works in IPRAW, UDP, or TCP Client mode, 0the destination IP must be set before the command CMD_OPEN_SOCKET_SN is sent
    jmp     ch395_set_ip_addr
.endproc
