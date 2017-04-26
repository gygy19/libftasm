;Intel x64 Assembly Registers Infos By jguyet@student.42.fr
;-------------------------------------------------------------------------------
rax     ;contient la valeur de retour des fonctions
;-------------------------------------------------------------------------------
rbx     ;registre general
;-------------------------------------------------------------------------------
rcx     ;compteur de boucle
;-------------------------------------------------------------------------------
rdx     ;partie haute d’une valeur 128 bits
;-------------------------------------------------------------------------------
rsi     ;argv[1]
;-------------------------------------------------------------------------------
rdi     ;argv[0]
;-------------------------------------------------------------------------------
rsp     ;pointeur de pile (stack pointer)
;-------------------------------------------------------------------------------
rbp     ;pointeur de base (base pointer)
;-------------------------------------------------------------------------------
r8 ..., r15  ;registre general
;-------------------------------------------------------------------------------
rip     ;registre general
;-------------------------------------------------------------------------------
rflags  ;contient des informations concernant le resultat
        ;de l’execution d’une instruction.
;----------------------------------RFLAGS---------------------------------------
;Bits  ;63.22|21| 20| 19|18|17|16|15|14|13..12|11|10| 9| 8| 7| 6|5| 4|3| 2|1| 0
;Flags ;  -  |ID|VIP|VIF|AC|VM|RF| 0|NT| IOPL |OF|DF|IF|TF|SF|ZF|0|AF|0|PF|1|CF
;-------------------------------------------------------------------------------
;Les bits 15, 5, 3, 1 ont une valeur fixe donnée dans le tableau ci-dessus.
CF    ;Carry Flag (bit 0) retenue
PF    ;Parity Flag (bit 2)
AF    ;Auxiliary Carry Flag (bit 4)
ZF    ;Zero Flag (bit 6) vaut 1 lorsque le resultat est 0
SF    ;Sign Flag (bit 7) bit de signe du r´esultat
OF    ;Overflow Flag (bit 11) depassement, le resultat contient trop de bits
DF    ;Direction Flag (bit 10) sens d’incr´ementation de ESI et EDI
TF    ;Task Flag (bit 8) active la gestion de tˆache en mode prot´eg´e
IF    ;Interrupt Flag (bit 9) interruption
IOPL  ;I/O Privilege Level (bits 12 et 13)
NT    ;Nested Task (bit 14)
RF    ;Resume Flag (bit 16) active le mode debug
VM    ;Vitrual 8086 Mode (bit 17)
AC    ;Alignement Check (bit 18)
VIF   ;Virtual Interrupt Flag (bit 19)
VIP   ;Virtual Interrupt Pending (bit 20)
ID    ;Identification Flag (bit 21)
;-------------------------------------------------------------------------------
;general registers 128bits
xmm0, xmm1, xmm2, ..., xmm15
;64bits registrers (63:0):
rax, rbx, rcx, rdx, rdi, rsi, rbp, rsp,  r8,  r9, ...,  r15, rflags
;32bits registrers (31:0):
eax, ebx, ecx, edx, edi, esi, ebp, esp, r8d, r9d, ..., r15d, eflags
;16 bits registers (15:0):
 ax,  bx,  cx,  dx,  di,  si,  bp,  sp, r8w, r9w, ..., r15w, flags
;8 bits high (15:8):
 ah,  bh,  ch,  dh
;8 bits low (7:0):
 al,  bl,  cl,  dl, dil, sil, bpl, spl, r8b, r9b, ..., r15b
