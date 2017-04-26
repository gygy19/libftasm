section .text
global _ft_puts

extern _ft_strlen
_ft_puts:
push	        rbp
mov           rsi         ,rdi      ;(1)set le pointer a afficher
call          _ft_strlen            ;cherche la longueur du text dans rdi
mov           rdx         ,rax      ;(2)set la longueur a afficher
mov           rdi         ,1        ;(3)signifie un envoie dans stdout 1
mov           rax         ,0x2000004;(4)appel de la function system write et retour dans
syscall                             ;(5)lancement de lappel de function system
pop           rbp
ret
