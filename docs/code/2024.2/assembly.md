# Assembly

## ch395_check_exist

***Description***

Checks if ch395 exists


***Example***

```ca65
 jsr ch395_check_exist
 cmp #CH395_DETECTED
 beq ch395_connected
 rts
ch395_connected:
```


***Modify***

* Accumulator 

***Returns***

* Accumulator : Returns #CH395_DETECTED if it exists



## ch395_clear_recv_buf_sn

***Description***

This command is used to clear the Socket receive buffer. It is necessary to input 1 byte of Socket index value. Upon receiving this command, CH395 will reset the receiving length of this Socket, and the receiving pointer will point to the buffer head.

***Input***

* Accumulator : Socket id

***Modify***

* Accumulator 
* Y Register 

***Example***

```ca65
 lda #CH395_SOCKET1 ; Socket ID
 jsr ch395_clear_recv_buf_sn
```



## ch395_close_socket_sn

***Description***

This command is used to close Socket. It is necessary to input a 1 byte of Socket index value. After Socket is closed, the receive buffer and transmit buffer of Socket are emptied, but the configuration information is still reserved, and you just need to open the Socket again when using the Socket the next time. In TCP mode, CH395 will automatically disconnect TCP before turning off Socket.

***Input***

* Accumulator : The id of the socket to close

***Modify***

* Y Register 

***Example***

```ca65
 lda #$01 ; Socket ID
 jsr ch395_close_socket_sn
```



## ch395_dhcp_enable

***Description***

This command is used to start or stop DHCP. It is necessary to input a 1-byte flag. If the flag is 1, it will indicate that DHCP is on; if the flag is 0, it will indicate that DHCP is off. CH395 must be initialized before DHCP is started. After DHCP is started, CH395 will broadcast DHCPDISCOVER message to the network to discover DHCP Server, request the address and other configuration parameters after finding DHCP Server, and then generate GINT_STAT_DHCP interrupt. MCU can send GET_DHCP_STATUS command to get DHCP status. If the status code is 0, it will indicate success, and MCU can send the command GET_IP_INF to get IP, MASK and other information. If the status code is 1, it will indicate error, which is generally caused by timeout, for example, no DHCP Server is found. DHCP is always in a working state after startup unless it receives a DHCP shutdown command from MCU. During this process, if DHCP Server reassigns a configuration to CH395 and the configuration is different from the original configuration, CH395 will still generate an interrupt. After timeout interrupt is generated, if DHCP Server is not found, CH395 will continue to send DHCPDISCOVER message at an interval of about 16 seconds. It takes about 20MS to execute this command. MCU can send GET_CMD_STATUS to query whether the execution has finished and the execution status

***Input***

* Accumulator : The mode to activate DHCP mode

***Modify***

* X Register 


## ch395_get_cmd_status

***Description***

Get cmd status


***Example***

```ca65
 jsr ch395_get_cmd_status
 ; Check A for STATUS
 rts
```


***Modify***

* Accumulator 


## ch395_get_dhcp_status

***Description***

Get dhcp status


***Example***

```ca65
 jsr ch395_get_dhcp_status
 ; Check A for dhcp status
 rts
```


***Modify***

* Accumulator 


## ch395_get_glob_int_status

***Description***

Get General interrupt Status


***Modify***

* Accumulator 

***Returns***

* Accumulator : Status 


***Example***

```ca65
 jsr ch395_get_glob_int_status
 ; check accumulator to get interrupts states
```



## ch395_get_ic_ver

***Description***

Get ch395 firmware version


***Modify***

* Accumulator 

***Returns***

* Accumulator : Version 


***Example***

```ca65
 jsr ch395_get_ic_ver
 ; Check A for version
 rts
```



## ch395_get_int_status_sn

***Description***

Check interrupt socket status

***Input***

* Accumulator : Socket id

***Modify***

* Accumulator 
* X Register 

***Returns***

* Accumulator : Status of selected socket


***Example***

```ca65
 lda #CH395_SOCKET1 ; Check socket 1
 jsr ch395_get_int_status_sn
 ; Check interrupt type
 and #CH395_SINT_STAT_SEND_OK
 cmp #CH395_SINT_STAT_SEND_OK
 beq @send_ok
 rts
```



## ch395_get_ip_inf

***Description***

Get ip info

***Input***

* Accumulator : the ptr to modify
* X Register : the ptr to modify

***Modify***

* Accumulator 
* X Register 
* Y Register 
* RESTmp value


## ch395_get_mac_adress

***Description***

Get mac address

***Input***

* Accumulator : the ptr
* X Register : the ptr

***Modify***

* Accumulator 
* X Register 
* Y Register 
* RESTmp value

***Returns***

* Accumulator : the content of ptr modified

* X Register : the content of ptr modified



## ch395_get_phy_status

***Description***

Get physical status


***Modify***

* Accumulator 

***Returns***

* Accumulator : The physical status


***Example***

```ca65
 jsr ch395_get_phy_status
 ; Check A physical status
 rts
```



## ch395_get_recv_len_sn

***Description***

Get the length received from socket

***Input***

* Accumulator : Socket id

***Example***

```ca65
 lda #$01 ; Socket 1
 jsr ch395_get_recv_len_sn
 ; check A and X for length received
ch395_connected:
```


***Modify***

* Accumulator 
* X Register 

***Returns***

* Accumulator : The length

* X Register : The length



## ch395_get_remot_ipp_sn

***Description***

Get remote ip connected to the socket

***Input***

* Accumulator : The Socket for the ip to get
* X Register : The ptr (high) to store the ip
* Y Register : The ptr (low) to store the ip

***Modify***

* Accumulator 
* X Register 
* Y Register 
* RES

***Example***

```ca65
 lda #$01 ; Socket 1
 ldx #<ip_dest
 ldy #>ip_dest
 jsr ch395_get_remot_ipp_sn
 rts
ipdest:
 .byte 192,168,0,1
```



## ch395_get_socket_status_sn

***Description***

Returns in A socket status (close/open ...)

***Input***

* Accumulator : Socket id

***Modify***

* X Register 
* Accumulator 

***Returns***

* Accumulator : The status

* X Register : The state


***Example***

```ca65
 lda #$01 ; Socket 1
 jsr ch395_get_socket_status_sn
 ; check A and X for the state
 cmp #CH395_SOCKET_CLOSED
 beq @soclet is closed
```



## ch395_init

***Description***

Initialize ch395


***Modify***

* Accumulator 
***Description***

Reset ch395


***Example***

```ca65
 jsr ch395_init
 ; Wait a bit
```



## ch395_open_socket_sn

***Description***

Open socket from arg

***Input***

* Accumulator : Socket id

***Modify***

* Y Register 


## ch395_read_recv_buf_sn

***Description***

Get buffer from socket

***Input***

* Accumulator : Socket id
* Y Register : Low ptr to fill
* X Register : X ptr to fill

***Modify***

* REStmp value
* RESBtmp value


## ch395_reset_all

***Description***

Reset ch395


***Example***

```ca65
 jsr ch395_reset_all
 ; Wait a bit
```



## ch395_retran_period

***Description***

Retran period

***Input***

* Accumulator : Period 
* X Register : Period 

***Modify***

* Y Register 

***Example***

```ca65
 lda #$FF
 ldx #$FF
 jsr ch395_retran_period
 rts
```



## ch395_set_des_port_sn

***Description***

Set dest port socket

***Input***

* Accumulator : Socketid 
* Y Register : Low int
* X Register : high int

***Modify***

* REStmp

***Example***

```ca65
 lda #$01
 ldx #80
 ldx #$00
 jsr ch395_set_des_port_sn
 rts
```



## ch395_set_fun_para

***Description***

Set fun para

***Input***

* Accumulator : Value 

***Modify***

* Y Register 
* Accumulator 


## ch395_set_gwip_addr

***Description***

Set gateway ip addr



## ch395_set_ip_addr

***Description***

Set ip row



## ch395_set_ip_addr_sn

***Description***

Set Socket Ip address to connect with

***Input***

* Accumulator : Socket id


## ch395_set_ipraw_pro_sn

***Description***

Set ipraw protocol on socket

***Input***

* Accumulator : Socket id
* X Register : the mode proto

***Modify***

* Y Register 


## ch395_set_mac_adress

***Description***

Set mac address

***Input***

* Accumulator : Low ptr mac adress
* X Register : High ptr mac adress

***Modify***

* Accumulator 
* Y Register 
* RES


## ch395_set_proto_type_sn

***Input***

* Accumulator : Socket id


## ch395_set_retran_count

***Description***

Set retran period

***Input***

* Accumulator : Retran period


## ch395_set_sour_port_sn

***Description***

Set source port

***Input***

* Accumulator : Socket id
* Y Register : Low ptr address
* X Register : High ptr address

***Modify***

* RES


## ch395_set_ttl

***Description***

This command is used to set Socket TTL. It is necessary to input 1 byte of Socket index value and 1 byte of TTL value. It shall be set after the Socket is opened, and the maximum value is 128

***Input***

* Accumulator : Socket ID
* X Register : TTL value


## ch395_tcp_connect_sn

***Input***

* Accumulator : Socket id


## ch395_tcp_disconnect_sn

***Input***

* Accumulator : Socket id


## ch395_tcp_listen_sn

***Description***

TCP listen socket



## ch395_write_send_buf_sn

***Description***

Send data to socketid

***Input***

* Accumulator : Socket ID
* Y Register : Low length
* X Register : High length
* RESB : Adress ptr to read

***Modify***

* RESTmp


