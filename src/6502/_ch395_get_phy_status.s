.include "ch395.inc"

.export _ch395_get_phy_status
.import ch395_get_phy_status

.proc _ch395_get_phy_status
    ;;@proto unsigned char ch395_get_phy_status();
    ;;@brief Get physical status
    ;;@```c
    ;;@`  unsigned char val;
    ;;@`  val = ch395_get_phy_status();
    ;;@`  if (val == CH395_PHY_DISCONN) {
    ;;@`    printf("Cable is disconnected");
    ;;@`  return 3;
    ;;@`  }
    ;;@`  rts
    ;;@```
    jmp     ch395_get_phy_status
.endproc
