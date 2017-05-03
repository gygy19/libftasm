;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_putstr.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_putstr

extern _ft_strlen
_ft_putstr:
push	        rbp

mov           rsi         ,rdi      ;(1)set le pointer a afficher
call          _ft_strlen            ;cherche la longueur du text dans rdi
mov           r10         ,rax
;write(rdi, rsi, rdx)               ;write(fd, pointer, length)
mov           rdi         ,1        ;(3)signifie un envoie dans stdout 1
mov           rdx         ,r10      ;(2)set la longueur a afficher
mov           rax         ,0x2000004;(4)appel de la function system write et retour dans
syscall                             ;(5)lancement de lappel de function system

pop           rbp
ret
