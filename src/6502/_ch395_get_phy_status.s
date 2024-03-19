.include "ch395.inc"

.export _ch395_get_phy_status
.import ch395_get_phy_status

.proc _ch395_get_phy_status
    ;;@proto unsigned char ch395_get_phy_status();
    ;;@brief Get physical status
    jmp     ch395_get_phy_status
.endproc
