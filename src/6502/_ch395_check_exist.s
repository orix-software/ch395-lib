.include "ch395.inc"

.export _ch395_check_exist
.import ch395_check_exist

.proc _ch395_check_exist
    ;;@proto unsigned char ch395_check_exist();
    ;;@brief Checks if ch395 exists
    ;;@```c
    ;;@`  val = ch395_check_exist();
    ;;@`  if (val == CH395_DETECTED) printf("Ch395 is here");
    ;;@```
    jmp    ch395_check_exist
.endproc
