section .text
global _ft_isdigit

_ft_isdigit:
push          rbp
cmp rdi, '9'              ;if (c > '9')
    jg isnotanumber       ;call isnotanumber();
cmp rdi, '0'              ;if (c < '0')
    jl isnotanumber       ;call isnotanumber();
isnumber:                 ;return (1)
mov           rax, 1
pop           rbp
ret
isnotanumber:             ;return (0)
mov           rax, 0
pop           rbp
ret
