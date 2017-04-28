;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_putchar.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .data
char          db          1

section .text
global _ft_putchar

_ft_putchar:
push	        rbp
push          rdi
push          rdx
push          rsi
push          rax
push          r8

mov           r8          ,char     ;r8 = addr of char
mov           [r8 + 0]    ,rdi      ;r8[0] = arg0

;write(rdi, rsi, rdx)               ;write(fd, pointer, length)
mov           rsi         ,r8       ;(1)set le pointer a afficher
mov           rdi         ,1        ;(3)signifie un envoie dans stdout 1
mov           rdx         ,1        ;(2)set la longueur a afficher
mov           rax         ,0x2000004;(4)appel de la function system write et retour dans
syscall                             ;(5)lancement de lappel de function system

pop           r8
pop           rax
pop           rsi
pop           rdx
pop           rdi
pop           rbp
ret
