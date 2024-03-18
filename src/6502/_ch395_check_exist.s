.ifndef CH395_COMMAND_PORT
    .include "ch395.inc"
.endif

.export _ch395_check_exist
.export ch395_check_exist

.proc _ch395_check_exist
    ;;@proto unsigned char ch395_check_exist();
    ;;@brief Checks if ch395 exists
    ;;@```c
    ;;@`  val = ch395_check_exist();
    ;;@`  if (val == CH395_DETECTED) printf("Ch395 is here");
    ;;@```
.endproc

.proc ch395_check_exist
    ;;@brief Checks if ch395 exists
    ;;@```ca65
    ;;@`  jsr ch395_check_exist
    ;;@`  cmp       #CH395_DETECTED
    ;;@`  beq ch395_connected
    ;;@`  rts
    ;;@`ch395_connected:
    ;;@```
    ;;@modifyA
    ;;@returnsA Returns #CH395_DETECTED if it exists
	lda     #CH395_CHECK_EXIST
    sta     CH395_COMMAND_PORT
    lda     #$55
    sta     CH395_DATA_PORT
    lda     CH395_DATA_PORT
    rts
.endproc
