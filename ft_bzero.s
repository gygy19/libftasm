
section .data

exit       db             "Exit code :", 0
text       db             "coucou", 10, 0
length     db             0

section .text
global _ft_bzero
;extern _ft_bzero

global _ft_puts
;extern _ft_puts

global _ft_strlen
;extern _ft_strlen
;global start

;start:
;push	        rbp				              ;cree une nouvelle frame rbp en haut de la pile
;mov           rdi         ,text
;;;call          _ft_bzero               ;appel ft_bzero(rdi)
;call          _ft_puts                ;affiche

;mov           rdi         ,text
;call          _ft_strlen
;mov           r10         ,rax

;mov           rdi         ,r10
;mov           rax         ,0x2000001
;syscall
;pop           rbp                     ;supprime de la stack la frame rbp
;ret


_ft_bzero:
push	        rbp
mov           r8          ,rdi      ;r8 = le text
call          _ft_strlen            ;cherche la longueur du text dans rdi
mov           r9          ,rax      ;r9 = len
mov           rax         ,0
while1:   cmp rax,r9                ;cmp i, len
          jge  endwhile1            ;si i >= len
          mov byte[r8 + rax], 0     ;mais a zero la valeur
          inc rax                   ;incremente index rax
          jmp while1                ;relancement de la while
endwhile1:
pop           rbp
ret

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

_ft_strlen:
push	        rbp
mov           rax         ,0
while:    cmp byte[rdi + rax] ,0  ;cmp arg[i], 0
          je  endwhile            ;si arg[i] == 0
          inc rax                 ;incremente index rax
          jmp while               ;relancement de la while
endwhile:
pop           rbp
ret

_ft_isalpha:
push	        rbp
mov           rax         ,0
while:    cmp byte[rdi + rax] ,0  ;cmp arg[i], 0
          je  endwhile            ;si arg[i] == 0
          inc rax                 ;incremente index rax
          jmp while               ;relancement de la while
endwhile:
pop           rbp
ret


;push	rbp				     ; Set up a new stack frame
;mov		rbp, rsp

;mov		rsp, rbp		; Remove stack frame and return
;pop		rbp
