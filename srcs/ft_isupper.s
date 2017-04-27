;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_isupper.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_isupper

_ft_isupper:
push	        rbp
cmp rdi ,'Z'                  ;if (c > 'Z')
    jg  isnotupper
cmp rdi ,'A'                  ;if (c < 'A')
    jl  isnotupper
isupper:
mov rax       ,1
pop           rbp
ret
isnotupper:
mov rax       ,0
pop           rbp
ret
