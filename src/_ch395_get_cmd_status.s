.include "ch395.inc"

.export _ch395_get_cmd_status
.import ch395_get_cmd_status

.proc _ch395_get_cmd_status
    ;;@brief Get cmd status
    ;;@proto unsigned char ch395_get_cmd_status();
    jmp     ch395_get_cmd_status
.endproc
