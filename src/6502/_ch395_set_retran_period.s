.include "ch395.inc"

.export _ch395_set_retran_period
.import ch395_set_retran_period

.proc _ch395_set_retran_period
    ;;@proto void          ch395_retran_period(unsigned int period);
    ;;@brief Retran period
    ;;@```c
    ;;@`  ch395_set_retran_period(1000);
    ;;@```
    jmp     ch395_set_retran_period
.endproc
