section .text
global _ft_strlen

_ft_strlen:
push	        rbp                 ;pile stack
mov           rcx         ,0      ;rcx = 0;
while:    cmp byte[rdi + rcx] ,0  ;if (arg[i] == 0)
          je  endwhile            ;call endwhile
          inc rcx                 ;rcx++
          jmp while               ;continue
endwhile:
mov           rax, rcx            ;return (rcx);
pop           rbp                 ;depile stack
ret
