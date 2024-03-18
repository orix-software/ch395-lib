.include "ch395.inc"

.export _ch395_get_glob_int_status
.import ch395_get_glob_int_status

.proc _ch395_get_glob_int_status
    ;;@proto unsigned int ch395_get_glob_int_status();
    ;;@brief Get General interrupt Status
    ;;@```c
    ;;@`  val = ch395_get_glob_int_status();
    ;;@`  // check val to get interrupts states
    ;;@```
    jmp     ch395_get_glob_int_status
.endproc

