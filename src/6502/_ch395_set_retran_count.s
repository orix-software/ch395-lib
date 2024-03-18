.include "ch395.inc"


.export _ch395_set_retran_count
.export ch395_set_retran_count

.proc _ch395_set_retran_count
    ;;@proto void          ch395_set_retran_count(unsigned int period);
    ;;@brief Set retran period
.endproc

.proc ch395_set_retran_count
    ;;@brief Set retran period
    ;;@inputA Retran period
    ldx     #CH395_SET_RETRAN_COUNT
    stx     CH395_COMMAND_PORT
    sta     CH395_DATA_PORT
    rts
.endproc
