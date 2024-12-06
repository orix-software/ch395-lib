# C

## unsigned char ch395_check_exist();

***Description***

This command is used to test the communication interface and working state to check whether CH395 is working properly. This command needs to input 1 byte of data, which can be any data. If CH395 is working properly, the output data of CH395 will be the bitwise reverse of the input data. For example, if the input data is 57H, the output data will be A8H.



## void ch395_clear_recv_buf_sn(unsigned char ID_SOCKET)

***Description***

This command is used to clear the Socket receive buffer. It is necessary to input 1 byte of Socket index value. Upon receiving this command, CH395 will reset the receiving length of this Socket, and the receiving pointer will point to the buffer head.



## void ch395_close_socket_sn(unsigned char socketid)

***Description***

This command is used to close Socket. It is necessary to input a 1 byte of Socket index value. After Socket is closed, the receive buffer and transmit buffer of Socket are emptied, but the configuration information is still reserved, and you just need to open the Socket again when using the Socket the next time. In TCP mode, CH395 will automatically disconnect TCP before turning off Socket.

***Input***




## void ch395_dhcp_enable()

***Description***

This command is used to start or stop DHCP. It is necessary to input a 1-byte flag. If the flag is 1, it will indicate that DHCP is on; if the flag is 0, it will indicate that DHCP is off. CH395 must be initialized before DHCP is started. After DHCP is started, CH395 will broadcast DHCPDISCOVER message to the network to discover DHCP Server, request the address and other configuration parameters after finding DHCP Server, and then generate GINT_STAT_DHCP interrupt. MCU can send GET_DHCP_STATUS command to get DHCP status. If the status code is 0, it will indicate success, and MCU can send the command GET_IP_INF to get IP, MASK and other information. If the status code is 1, it will indicate error, which is generally caused by timeout, for example, no DHCP Server is found. DHCP is always in a working state after startup unless it receives a DHCP shutdown command from MCU. During this process, if DHCP Server reassigns a configuration to CH395 and the configuration is different from the original configuration, CH395 will still generate an interrupt. After timeout interrupt is generated, if DHCP Server is not found, CH395 will continue to send DHCPDISCOVER message at an interval of about 16 seconds. It takes about 20MS to execute this command. MCU can send GET_CMD_STATUS to query whether the execution has finished and the execution status



***Description***

Get cmd status

## unsigned char ch395_get_cmd_status();



## unsigned char ch395_get_dhcp_status();

***Description***

Get dhcp status





## unsigned int ch395_get_glob_int_status();

***Description***

Get General interrupt Status



## unsigned char ch395_get_ic_ver();

***Description***

This command is used to get the chip and firmware versions. 1 byte of data returned is the version number, the bit 7 is 0, the bit 6 is 1, and the bits 5-0 are the version number. If the returned value is 41H, remove bits 7 and 6, and the version number will be 01H. It is called chip version in this text



## unsigned char ch395_get_int_status_sn(unsigned char ID_SOCKET);

***Description***

Check interrupt socket status

***Input***




   ;;@inputA Socket id
   ;;@modifyA
   ;;@modifyX
   ;;@returnsA Status of selected socket
   ;;@```ca65
   ;;@`  lda     #CH395_SOCKET1 ; Check socket 1
   ;;@`  jsr     ch395_get_int_status_sn
   ;;@`  ; Check interrupt type
   ;;@`  and     #CH395_SINT_STAT_SEND_OK
   ;;@`  cmp     #CH395_SINT_STAT_SEND_OK
   ;;@`  beq     @send_ok
   ;;@`  rts
   ;;@```
ldx     #CH395_GET_INT_STATUS_SN
   stx     CH395_COMMAND_PORT
   sta     CH395_DATA_PORT
   lda     CH395_DATA_PORT
   rts
endproc
## void ch395_get_ip_inf(unsigned char ip_infos[]);

***Description***

Get ip info : ip_infos must be 20 bytes length)



## void ch395_get_mac_adress(unsigned char macaddress[]);

***Description***

Get mac address



## unsigned char ch395_get_phy_status();

***Description***

Get physical status



## void ch395_get_recv_len_sn(unsigned char ID_SOCKET)

***Description***

Get the length received from socket

***Input***




## void ch395_get_remot_ipp_sn(unsigned char *ptr, unsigned char socket);

***Description***

Get remote ip connected to the socket

***Input***




## unsigned int ch395_get_socket_status_sn(unsigned char ID_SOCKET);

***Description***

Returns in A socket status (close/open ... )

***Input***




## void ch395_init();

***Description***

;;@brief This command is used to initialize CH395, including initializing MAC, PHY and TCP/IP stack of CH395. Generally, it takes 350mS to execute the command. MCU can send GET_CMD_STATUS to query whether the execution has finished and the execution status.



## void ch395_open_socket_sn(unsigned char ID_SOCKET)

***Input***




## void ch395_read_recv_buf_sn(unsigned char *buffer, unsigned int ptr2,unsigned char ID_SOCKET);

***Input***




## void ch395_reset_all()

***Description***

Reset ch395



## void ch395_set_des_port_sn(unsigned int port, unsigned char ID_SOCKET);

***Description***

Set dest port socket

***Input***




## void ch395_set_fun_para(unsigned char flag)

***Description***

Set fun para



***Description***

Set gateway ip addr



***Description***

This command is used to set the destination IP address of Socket. It is necessary to input 1 byte of Socket index value and 4 bytes of destination IP address. When Socket works in IPRAW, UDP, or TCP Client mode, 0the destination IP must be set before the command CMD_OPEN_SOCKET_SN is sent



## void ch395_set_ip_addr_sn(unsigned char ip_addr[], unsigned char ID_SOCKET)



## void ch395_set_ipraw_pro_sn(unsigned char ID_SOCKET);

***Description***

Set ipraw protocol on socket

***Input***




## void ch395_set_mac_adress(unsigned char macaddress[]);



## void ch395_set_proto_type_sn(unsigned char proto, unsigned char ID_SOCKET)

***Input***




## void ch395_set_retran_count(unsigned int period);

***Description***

Set retran period



## void ch395_retran_period(unsigned int period);

***Description***

Retran period



## void ch395_set_sour_port_sn(unsigned int port,unsigned char ID_SOCKET)

***Description***

Set source socket

***Input***




***Description***

This command is used to set Socket TTL. It is necessary to input 1 byte of Socket index value and 1 byte of TTL value. It shall be set after the Socket is opened, and the maximum value is 128

## ch395_set_ttl(unsigned char ID_SOCKET, unsigned char ttl_value);



## void ch395_tcp_connect_sn(unsigned char ID_SOCKET)

***Input***




## void ch395_tcp_disconnect_sn(unsigned char ID_SOCKET)

***Input***




## void ch395_tcp_listen_sn(unsigned char ID_SOCKET)



## void ch395_write_send_buf_sn(unsigned char *buffer, unsigned int length,unsigned char ID_SOCKET);

***Description***

Send data to socketid [Not working]

***Input***




