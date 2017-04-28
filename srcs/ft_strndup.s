;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_strndup.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_strndup


extern _malloc
extern _ft_memcpy

_ft_strndup:
push    rbp
push    rdi
push    rsi
push    rdx
push    r15
push    r14
push    r10

mov     r15,   rdi          ;r15 = arg0
mov     r14,   rsi          ;r14 = arg1

mov     rcx,  r14           ;arg0 = r14
call    _malloc             ;call malloc
mov     r10,  rax           ;r10 = malloc(r14);

if:     cmp r10, 0
        je exit

mov     rdi, r10            ;arg0 = r10 (char *dest)
mov     rsi, r15            ;arg1 = r15 (char *src)
mov     rdx, r14            ;arg2 = r14 (int len)
call    _ft_memcpy          ;call ft_memcpy(arg0, arg1, arg2);
mov     r10,   rax          ;r10 = ft_memcpy(arg0, arg1, arg2);

mov     rax,  r10           ;return (r10)
exit:                       ;return malloc value 0

pop     r10
pop     r14
pop     r15
pop     rdx
pop     rsi
pop     rdi
pop     rbp
ret
