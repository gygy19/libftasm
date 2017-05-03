;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_strnew.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_strnew

extern _malloc
extern _ft_bzero
_ft_strnew:
push	        rbp
push          r15
push          r10

mov     r15,   rdi          ;r15 = arg0
inc     r15

mov     r14,   rsi
push    rax
mov     rdi,  r15           ;arg0 = r14
call    _malloc             ;call malloc
mov     r10,  rax           ;r10 = malloc(r14);
pop     rax
mov     rsi,   r14

push    rdi
push    rsi
mov     rsi,  r15
mov     rdi,  r10
call    _ft_bzero
mov     rax,  r10
pop     rsi
pop     rdi

pop           r10
pop           r15
pop           rbp
ret
