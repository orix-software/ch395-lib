.ifndef CH395_COMMAND_PORT
    .include "../include/ch395.inc"
.endif

.proc _ch395_set_ipraw_pro_sn
    ; A the socket
    ; X the mode proto

    ;xWriteCH395Cmd(CMD20_SET_IPRAW_PRO_SN);
    ;xWriteCH395Data(sockindex);
    ;xWriteCH395Data(prototype);
    ;xEndCH395Cmd();

    ldy     #CH395_SET_IPRAW_PRO_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT ; Set socket port
    stx     CH395_DATA_PORT

    rts
.endproc
