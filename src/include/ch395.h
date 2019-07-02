//typedef ch395ipaddress byte[4];
//typedef ch395macaddress byte[6];

unsigned char ch395_get_ic_ver();

//ch395macaddress *ch395_get_mac_adress();
void ch395_reset_all();
void ch395_check_exist();
void ch395_init();
//void ch395_set_gwip_addr(ch395ipaddress gatewayipadress);

#define CH395_ERR_SUCCESS 0x00 /* Success*/
#define CH395_ERR_BUSY    0x10 /* Occupé, indiquant que la commande est en cours d'exécution */
#define CH395_ERR_MEM     0x11 /* Erreur de gestion de la mémoire */
#define CH395_ERR_BUF     0x12 /* Erreur de tampon */
#define CH395_ERR_TIMEOUT 0x13 /* Timeout */
#define CH395_ERR_RTE     0x14 /* Erreur de routage */
#define CH395_ERR_ABRT    0x15 /* Abandon de la connexion */
#define CH395_ERR_RST     0x16 /* Connexion réinitialisée */
#define CH395_ERR_CLSD    0x17 /* Connexion fermée */
#define CH395_ERR_CONN    0x18 /* Pas de connexion */
#define CH395_ERR_VAL     0x19 /* Mauvaise valeur */
#define CH395_ERR_ARG     0x1A /* Erreur de paramètre */
#define CH395_ERR_USE     0x1B /* Déjà utilisé */
#define CH395_ERR_IF      0x1C /* Erreur MAC */
#define CH395_ERR_ISCONN  0x1D /*  Connecté*/
#define CH395_ERR_OPEN    0x20 /* Ouvert */


