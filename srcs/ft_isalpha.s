;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_isalpha.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_isalpha

extern _ft_islower
extern _ft_isupper

_ft_isalpha:
push	        rbp
call _ft_islower
mov   r10,    rax
call _ft_isupper
mov   r11,    rax

cmp r10 , 1
    je isalpha
cmp r11 , 1
    je isalpha
isnotalpha:
mov rax       ,0
pop           rbp
ret
isalpha:
mov rax       ,1
pop           rbp
ret
