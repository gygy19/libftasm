;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_memcpy.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_memcpy

_ft_memcpy:
push      rbp         ;pile on stack
mov       r8  ,rdi    ;r8 = arg0 (void* b)
mov       r9  ,rsi    ;r9 = arg1 (void* src)
mov       r10 ,rdx    ;r10 = arg2 (size_t len)
mov       r12 ,0      ;r12 = 0

while:cmp r12 ,r10    ;while (r12 < r10)
      jge   endwhile   ;{
      mov al  ,[r9 + r12]   ;al = r9[0]
      mov byte [r8 + r12], al;r8[i] = r9
      inc r12         ;r12++;
      jmp while       ;}
endwhile:
mov       rax ,r8    ;return (tmp)
pop       rbp         ;depile on stack
ret
