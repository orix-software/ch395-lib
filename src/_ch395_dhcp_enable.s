.include "ch395.inc"

.export _ch395_dhcp_enable
.import ch395_dhcp_enable

.proc _ch395_dhcp_enable
   ;;@proto void ch395_dhcp_enable()
   ;;@brief This command is used to start or stop DHCP. It is necessary to input a 1-byte flag. If the flag is 1, it will indicate that DHCP is on; if the flag is 0, it will indicate that DHCP is off. CH395 must be initialized before DHCP is started. After DHCP is started, CH395 will broadcast DHCPDISCOVER message to the network to discover DHCP Server, request the address and other configuration parameters after finding DHCP Server, and then generate GINT_STAT_DHCP interrupt. MCU can send GET_DHCP_STATUS command to get DHCP status. If the status code is 0, it will indicate success, and MCU can send the command GET_IP_INF to get IP, MASK and other information. If the status code is 1, it will indicate error, which is generally caused by timeout, for example, no DHCP Server is found. DHCP is always in a working state after startup unless it receives a DHCP shutdown command from MCU. During this process, if DHCP Server reassigns a configuration to CH395 and the configuration is different from the original configuration, CH395 will still generate an interrupt. After timeout interrupt is generated, if DHCP Server is not found, CH395 will continue to send DHCPDISCOVER message at an interval of about 16 seconds. It takes about 20MS to execute this command. MCU can send GET_CMD_STATUS to query whether the execution has finished and the execution status
   jmp      ch395_dhcp_enable
.endproc
