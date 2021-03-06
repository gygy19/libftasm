;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_strdup.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_strdup


extern _malloc
extern _ft_strlen
extern _ft_memcpy
extern _ft_strnew
extern _ft_bzero

_ft_strdup:
push    rbp

mov     r15,   rdi

call    _ft_strlen          ;ft_strlen(rdi);
mov     r14,   rax          ;r14 = ft_strlen(arg0);

mov     rdi,  r14           ;arg0 = r14
call    _ft_strnew
mov     r10,  rax

mov     rdi, r10            ;arg0 = r10 (char *dest)
mov     rsi, r15            ;arg1 = r15 (char *src)
mov     rdx, r14            ;arg2 = r14 (int len)
call    _ft_memcpy          ;call ft_memcpy(arg0, arg1, arg2);
mov     r10,   rax          ;r10 = ft_memcpy(arg0, arg1, arg2);

mov     rax,  r10           ;return (r10)
exit:                       ;return malloc value 0

pop     rbp
ret
