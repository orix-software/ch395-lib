.include "ch395.inc"

.export _ch395_reset_all
.import ch395_reset_all

.proc _ch395_reset_all
    ;;@proto void ch395_reset_all()
    ;;@brief Reset ch395
    ;;@```c
    ;;@`  ch395_reset_all();
    ;;@`  ; Wait a bit
    ;;@```
    jmp     ch395_reset_all
.endproc
