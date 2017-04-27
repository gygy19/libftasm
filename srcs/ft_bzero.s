;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_bzero.s                                         :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_bzero

_ft_bzero:
push	        rbp
mov           r8          ,rdi      ;r8 = le text
mov           r9          ,rsi      ;r9 = len
mov           rax         ,0
while1:   cmp rax,r9                ;cmp i, len
          jge  endwhile1            ;si i >= len
          mov byte[r8 + rax], 0     ;mais a zero la valeur
          inc rax                   ;incremente index rax
          jmp while1                ;relancement de la while
endwhile1:
pop           rbp
ret
