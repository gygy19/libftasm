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

_ft_cat:
push  rbp

mov   rax,    0x2000003 ;read function
mov   rdi,    fd
mov   rsi,    buffer    ;

pop   rbp
ret

section .bss
buffer:       resw 4096;allocation pointer
