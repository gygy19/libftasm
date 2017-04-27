;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_islower.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_islower

_ft_islower:
push	        rbp
cmp rdi ,'z'                  ;if (c > 'z')
    jg  isnotlower
cmp rdi ,'a'                  ;if (c < 'a')
    jl  isnotlower
islower:
mov rax       ,1
pop           rbp
ret
isnotlower:
mov rax       ,0
pop           rbp
ret
