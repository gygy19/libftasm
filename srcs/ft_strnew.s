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

inc     rdi

call    _malloc                     ;call malloc

if2: cmp byte[rax], 0
    je end

mov     rsi,  rdi
mov     rdi,  rax
call    _ft_bzero

end:
pop           rbp
ret
