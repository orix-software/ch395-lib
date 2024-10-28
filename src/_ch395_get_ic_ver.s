.include "../include/ch395.inc"

.export _ch395_get_ic_ver
.import ch395_get_ic_ver

.proc _ch395_get_ic_ver
    ;;@proto unsigned char ch395_get_ic_ver();
    ;;@brief This command is used to get the chip and firmware versions. 1 byte of data returned is the version number, the bit 7 is 0, the bit 6 is 1, and the bits 5-0 are the version number. If the returned value is 41H, remove bits 7 and 6, and the version number will be 01H. It is called chip version in this text
    ;;@```c
    ;;@`  unsigned char val;
    ;;@`  val = ch395_get_ic_ver();
    ;;@`  printf("CH396 version %d\n",val)
    ;;@`  rts
    ;;@```
    jmp     ch395_get_ic_ver
.endproc
