.include "ch395.inc"

.export _ch395_check_exist
.import ch395_check_exist

.proc _ch395_check_exist
    ;;@proto unsigned char ch395_check_exist();
    ;;@brief This command is used to test the communication interface and working state to check whether CH395 is working properly. This command needs to input 1 byte of data, which can be any data. If CH395 is working properly, the output data of CH395 will be the bitwise reverse of the input data. For example, if the input data is 57H, the output data will be A8H.
    ;;@```c
    ;;@`  val = ch395_check_exist();
    ;;@`  if (val == CH395_DETECTED) printf("Ch395 is here");
    ;;@```
    jmp    ch395_check_exist
.endproc
