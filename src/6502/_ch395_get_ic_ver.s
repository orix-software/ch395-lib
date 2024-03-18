.include "../include/ch395.inc"

.export _ch395_get_ic_ver
.import ch395_get_ic_ver

.proc _ch395_get_ic_ver
    ;;@proto unsigned char ch395_get_ic_ver();
    ;;@brief Get ch395 firmware version
    ;;@```c
    ;;@`  unsigned char val;
    ;;@`  val = ch395_get_ic_ver();
    ;;@`  printf("CH396 version %d\n",val)
    ;;@`  rts
    ;;@```
    jmp ch395_get_ic_ver
.endproc
