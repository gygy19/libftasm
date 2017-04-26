section .text
global _ft_isascii

_ft_isascii:
push          rbp
cmp rdi, 127              ;if (c > 127)
    jg isnotascii         ;call isnotascii();
cmp rdi, 0                ;if (c < '\0')
    jl isnotascii         ;call isnotascii();
isascii:                  ;return (1)
mov           rax, 1
pop           rbp
ret
isnotascii:               ;return (0)
mov           rax, 0
pop           rbp
ret
