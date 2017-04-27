;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_isprint.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_isprint

_ft_isprint:
push          rbp
cmp rdi, 126            ;if (c > 126)
    jg isnotprintable   ;call isnotprintable();
cmp rdi, 32             ;if (c < 32)
    jl isnotprintable   ;call isnotprintable();
isprintable:            ;return (1)
mov           rax, 1
pop           rbp
ret
isnotprintable:         ;return (0)
mov           rax, 0
pop           rbp
ret
