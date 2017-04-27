;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_memset.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_memset

_ft_memset:
push      rbp         ;pile on stack
mov       r8  ,rdi    ;r8 = arg0 (void* b)
mov       r9  ,rsi    ;r9 = arg1 (int c)
mov       r10 ,rdx    ;r10 = arg2 (size_t len)
mov       r11 ,rdi    ;tmp = arg0 (void* b)

while:cmp r10 ,0      ;while (r10 > 0)
      jle  endwhile   ;{
      mov [r8 + 0], r9;r8[i] = r9
      inc r8          ;r8++;
      dec r10         ;r10--;
      jmp while       ;}
endwhile:
mov       rax ,r11    ;return (tmp)
pop       rbp         ;depile on stack
ret
