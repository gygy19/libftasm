section .text
global _ft_islower

_ft_islower:
push	        rbp
cmp rdi ,'z'                  ;if (c > 'z')
    jg  isnotlower
cmp rdi ,'a'                  ;if (c < 'a')
    jl  isnotlower
islower:
mov rax       ,1
pop           rbp
ret
isnotlower:
mov rax       ,0
pop           rbp
ret
