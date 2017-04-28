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

_ft_cat:
push  rbp                     ;pile on the stack

mov   r15,     rdi            ;r15 = arg0

cmp   rdi,     0              ;if (arg0 < 0)
jl    finish                  ;return ;

while:                        ;while (true) {
      mov   rdi,    buffer    ;pointer (arg0)
      mov   rsi,    4096      ;length (arg1)
      call  _ft_bzero         ;ft_bzero(arg0, arg1);

      mov   rdi,    r15       ;file descriptor (arg0)
      mov   rsi,    buffer    ;buffer (arg1)
      mov   rdx,    4095      ;read size (arg2)
      mov   rax,    0x2000003 ;read function rax = read(arg0, arg1, arg2);
      syscall                 ;call read system function

      mov   r9,     rax       ;r9 = ret of read

      cmp   r9,     0         ;if (ret == 0)
      je    finish            ;return ;

      mov   rdi,    buffer    ;pointer (arg0)
      call  _ft_putstr        ;ft_putstr(arg0);
jmp   while                   ;}

finish:
pop   rbp                     ;depile of the stack
ret

section .bss
buffer:     resw    4096      ;allocation pointer
