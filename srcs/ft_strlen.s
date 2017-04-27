;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_strlen.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_strlen

_ft_strlen:
push	        rbp                 ;pile stack
while:
          mov al, 0               ;al = 0000 0000, if (rdi[x] == al)
          mov rcx, 0              ;rcx = 0000 0000
          not rcx                 ;0101 0011 -> 1010 1100
          cld                     ;clean all processor flags to zero
          repne scasb             ;if (rdi[x] != a) goto while
endwhile:
not           rcx
dec           rcx
mov           rax,  rcx           ;return (rcx);
pop           rbp                 ;depile stack
ret

;BIEN MIEUX !!!!!
;_ft_strlen:
;push	        rbp                  ;pile stack
;mov           rcx         ,0      ;rcx = 0;
;while:    cmp byte[rdi + rcx] ,0  ;if (arg[i] == 0)
;          je  endwhile            ;call endwhile
;          inc rcx                 ;rcx++
;          jmp while               ;continue
;endwhile:
;mov           rax, rcx            ;return (rcx);
;pop           rbp                 ;depile stack
;ret
