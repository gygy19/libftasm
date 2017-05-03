;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_cat.s                                           :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_cat

extern _ft_putstr
extern _ft_bzero

extern _ft_putnbr

_ft_cat:
push  rbp                     ;pile on the stack

cmp   rdi,     0              ;if (arg0 < 0)
jl    finish                  ;return ;

mov   r15,     rdi            ;r15 = arg0

mov   rdi,    buffer          ;pointer (arg0)
mov   rsi,    40096           ;length (arg1)
call  _ft_bzero               ;ft_bzero(arg0, arg1);

mov   rdi,    r15             ;file descriptor (arg0)
mov   rsi,    buffer          ;buffer (arg1)
mov   rdx,    40095           ;read size (arg2)
mov   rax,    0x2000003       ;read function rax = read(arg0, arg1, arg2);
syscall                       ;call read system function

mov   r9,     rax             ;r9 = ret of read

cmp   r9,     0               ;if (ret == 0)
je    finish                  ;return ;

mov   rdi,    buffer          ;pointer (arg0)
call  _ft_putstr              ;ft_putstr(arg0);

finish:
pop   rbp                     ;depile of the stack
ret

section .bss
buffer:     resw    40096     ;allocation pointer
