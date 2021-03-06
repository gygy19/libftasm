;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_memset.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_memset

_ft_memset:
mov     r8,     rdi

cmp     rdx,    0   ;while (rdi[rcx] != 0)
je      end
mov     rax,    rsi ;rax = arg1
mov     rcx,    rdx ;rcx = arg2
cld                 ;rdi++;
rep     stosb       ;*rdi = c

end:
mov     rax,    r8  ;return (saved rdi);
ret
