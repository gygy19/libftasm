;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_isalnum.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_isalnum

extern _ft_isalpha
extern _ft_isdigit
_ft_isalnum:
push rbp              ;up stack

mov r10, rdi          ;r10 = rdi(first argument)

call _ft_isalpha      ;rax = ft_isalpha(rdi)
cmp rax, 1            ;if (rax == 1)
je isalnum            ;   call isalnum

call _ft_isdigit      ;rax = ft_isdigit(rdi)
cmp rax, 1            ;if (rax == 1)
je isalnum            ;   call isalnum

isnotalnum:           ;return (0)
mov rax, 0
pop rbp               ;down stack
ret
isalnum:              ;return (1)
mov rax, 1
pop rbp               ;down stack
ret
