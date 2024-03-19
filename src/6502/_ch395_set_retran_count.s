.include "ch395.inc"

.export _ch395_set_retran_count
.import ch395_set_retran_count

.proc _ch395_set_retran_count
    ;;@proto void          ch395_set_retran_count(unsigned int period);
    ;;@brief Set retran period
    jmp     ch395_set_retran_count
.endproc
