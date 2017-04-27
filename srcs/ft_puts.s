section .data

backn   db  10, 0

section .text
global _ft_puts

extern _ft_strlen
_ft_puts:
;The function int ft_puts(const char *s) writes the string s, and a terminating newline character, to the
;stream stdout.
push	        rbp
cmp           rdi, 0
je            error

mov           rsi         ,rdi      ;(1)set le pointer a afficher
call          _ft_strlen            ;cherche la longueur du text dans rdi
mov           r10         ,rax
;write(rdi, rsi, rdx)               ;write(fd, pointer, length)
mov           rdx         ,r10      ;(2)set la longueur a afficher
mov           rdi         ,1        ;(3)signifie un envoie dans stdout 1
mov           rax         ,0x2000004;(4)appel de la function system write et retour dans
syscall                             ;(5)lancement de lappel de function system

;Print '\n'
;write(rdi, rsi, rdx)               ;write(fd, pointer, length)
mov           rsi         ,backn    ;(1)set le pointer a afficher
mov           rdx         ,1        ;(2)set la longueur a afficher
mov           rdi         ,1        ;(3)signifie un envoie dans stdout 1
mov           rax         ,0x2000004;(4)appel de la function system write et retour dans write
syscall
;RETURN VALUES
;The functions int ft_puts(const char *s) return a nonnegative integer on success and EOF on error.
add           r10         ,10
mov           rax         ,r10      ;return length Of string + (EOF)
pop           rbp
ret
error:
;Print '\n'
;write(rdi, rsi, rdx)               ;write(fd, pointer, length)
mov           rsi         ,backn    ;(1)set le pointer a afficher
mov           rdx         ,1        ;(2)set la longueur a afficher
mov           rdi         ,1        ;(3)signifie un envoie dans stdout 1
mov           rax         ,0x2000004;(4)appel de la function system write et retour dans write
syscall
mov           rax         ,10       ;return(EOF)
pop           rbp
ret
