.proc ch395_get_glob_int_status_all
    ;;@brief This command is used to get the global interrupt status. CH395 will output 2 bytes of global interrupt status after receiving this command. Global interrupt status is defined as follows:
    ;;Bit Name Description
    ;;[12：18] - Reserved
    ;;11 GINT_STAT_SOCK7 Socket7 interrupt
    ;;10 GINT_STAT_SOCK6 Socket6 interrupt
    ;;CH395 Datasheet http://wch.cn13
    ;;9 GINT_STAT_SOCK5 Socket5 interrupt
    ;;8 GINT_STAT_SOCK4 Socket4 interrupt
    ;;7 GINT_STAT_SOCK3 Socket3 interrupt
    ;;6 GINT_STAT_SOCK2 Socket2 interrupt
    ;;5 GINT_STAT_SOCK1 Socket1 interrupt
    ;;4 GINT_STAT_SOCK0 Socket0 interrupt
    ;;3 GINT_STAT_DHCP DHCP interrupt
    ;;2 GINT_STAT_PHY_CHANGE PHY status change interrupt
    ;;1 GINT_STAT_IP_CONFLI IP conflict
    ;;0 GINT_STAT_UNREACH Inaccessible interrupt
    ;;For bits 0-7, please refer to Section 5.15.
    ;;GINT_STAT_SOCK4 - GINT_STAT_SOCK7: Socket interrupt. When there is an interrupt event in Socket,
    ;;CH395 will generate this interrupt. MCU needs to send GET_INT_STATUS_SN to get the interrupt status of
    ;;Socket. Please refer to GET_INT_STATUS_SN.
    ;;CH395 can get the interrupt status through two commands CMD_GET_GLOB_INT_STATUS and
    ;;CMD_GET_GLOB_INT_STATUS_ALL. The low 8-bit interrupt status can be only gotten through the
    ;;former command, and the full interrupt status can be gotten through the latter command. It shall be noted
    ;;that any version of chip supports the command CMD_GET_GLOB_INT_STATUS. If the chip version
    ;;number is more than or equal to 0X44 and Socket4 -- Socke7 is used, only
    ;;CMD_GET_GLOB_INT_STATUS_ALL can be used. If the chip version number is less than 0X44, the
    ;;command CMD_GET_GLOB_INT_STATUS_ALL will not be supported
    ;;@failure Does not work
.endproc
