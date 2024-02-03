# Assembly

## ch395_check_exist

***Description***

Checks if ch395 exists


***Modify***

* Accumulator 

***Returns***

* Accumulator : Returns #AA if it exists



## ch395_clear_recv_buf_sn

***Description***

Clear receive buffer


***Modify***

* Accumulator 
* Y Register 


## ch395_close_socket_sn

***Description***

Close socket

***Input***

* Accumulator : The id of the socket

***Modify***

* Y Register 


## ch395_dhcp_enable

***Description***

Enable or not dhcp

***Input***

* Accumulator : The mode to activate DHCP mode

***Modify***

* X Register 


## ch395_get_cmd_status

***Description***

Get cmd status


***Modify***

* Accumulator 


## ch395_get_dhcp_status


***Modify***

* Accumulator 


## ch395_get_glob_int_status


***Modify***

* Accumulator 


## ch395_get_ic_ver

***Description***

Get ch395 firmware version


***Modify***

* Accumulator 


## ch395_get_int_status_sn


***Modify***

* Accumulator 
* X Register 


## ch395_get_mac_adress


***Modify***

* Accumulator 
* X Register 
* Y Register 


## ch395_get_phy_status



## ch395_get_recv_len_sn


***Modify***

* Accumulator 
* X Register 


## ch395_get_remot_ipp_sn


***Modify***

* Accumulator 
* X Register 
* Y Register 


## ch395_get_socket_status_sn

***Description***

Returns in A socket status (close/open)


***Modify***

* X Register 
* Accumulator 


## ch395_init


***Modify***

* Accumulator 


## ch395_open_socket_sn



## ch395_read_recv_buf_sn



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


***Example***

```ca65
 lda #$FF
 ldx #$FF
 jsr ch395_retran_period
```



## ch395_set_des_port_sn



## ch395_set_fun_para

***Input***

* Accumulator : Value 

***Modify***

* Y Register 
* Accumulator 


## ch395_set_gwip_addr



## ch395_set_ip_addr

***Description***

Set ip addr



## ch395_set_ip_addr_sn



## ch395_set_ipraw_pro_sn

***Description***

Set ipraw protocol on socket



## ch395_set_mac_adress

***Description***

Set mac address



## ch395_set_proto_type_sn



## ch395_set_retran_count



## ch395_set_sour_port_sn



## ch395_tcp_connect_sn



## ch395_tcp_disconnect_sn



## ch395_tcp_listen_sn



## ch395_write_send_buf_sn



