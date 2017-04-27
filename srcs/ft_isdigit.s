;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_isdigit.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_isdigit

_ft_isdigit:
push          rbp
cmp rdi, '9'              ;if (c > '9')
    jg isnotanumber       ;call isnotanumber();
cmp rdi, '0'              ;if (c < '0')
    jl isnotanumber       ;call isnotanumber();
isnumber:                 ;return (1)
mov           rax, 1
pop           rbp
ret
isnotanumber:             ;return (0)
mov           rax, 0
pop           rbp
ret
