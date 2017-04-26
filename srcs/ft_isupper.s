section .text
global _ft_isupper

_ft_isupper:
push	        rbp
cmp rdi ,'Z'                  ;if (c > 'Z')
    jg  isnotupper
cmp rdi ,'A'                  ;if (c < 'A')
    jl  isnotupper
isupper:
mov rax       ,1
pop           rbp
ret
isnotupper:
mov rax       ,0
pop           rbp
ret
