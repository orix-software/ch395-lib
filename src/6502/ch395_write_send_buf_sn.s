.include "ch395.inc"
.include "telestrat.inc"

.export ch395_write_send_buf_sn

.proc ch395_write_send_buf_sn
    ;;@brief This command is used to write data to Socket transmit buffer. It is necessary to input 1 byte of Socket index value, 2 bytes of length (low bytes in front) and several bytes of data stream. The length of input data must not be larger than the size of transmit buffer. However, in MACRAW mode, the maximum length of input data can only be 1514, and any redundant data will be discarded. After the external MCU writes the data, CH395 will encapsulate the data packet according to the working mode of Socket, and then send it. Before MCU receives SINT_STAT_SENBUF_FREE, it is not allowed to write data into Socket transmit buffer again
    ;;@inputA Socket ID
    ;;@inputY Low length
    ;;@inputX High length
    ;;@inputMEM_RESB Adress ptr to read
    ;;@modifyMEM_RES Tmp
    ;;@```ca65
    ;;@sta     RESB    ; Ptr low to write
    ;;@sty     RESB+1  ; ptr high to write
    ;;@ldy     #<1000 ; Low length
    ;;@ldx     #>1000 ; High length
    ;;@lda     #$00 ; socket 0
    ;;@jsr     ch395_write_send_buf_sn
    ;;@rts
    ;;@```

    sty     RESB     ; Save low length
    stx     RESB+1   ; Save low length

    ; A contains Socket

entry_point_c:
    ldy     #CH395_WRITE_SEND_BUF_SN
    sty     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT         ; Store socket value

    lda     RESB
    sta     CH395_DATA_PORT ; set length low
    stx     CH395_DATA_PORT ; set length high


    lda     RESB
    beq     @decrement

@restart:
    ldy     #$00

@loop:
    lda     (RES),y
    sta     CH395_DATA_PORT
    iny
    cpy     RESB
    bne     @loop
    tya
    clc
    adc     RES
    bcc     @S1
    inc     RES+1

@S1:
    sta     RES

@decrement:
    ldx     RESB+1
    ldy     #$00

@L1:
    lda     (RES),y
    sta     CH395_DATA_PORT
    iny
    bne     @L1
    inc     RES+1
    dex
    bpl     @L1

@exit:
    rts
.endproc
