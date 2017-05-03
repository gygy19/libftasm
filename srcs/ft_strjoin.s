;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_strjoin.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_strjoin

extern _ft_strlen
extern _ft_strnew
extern _ft_putstr
extern _ft_putchar
_ft_strjoin:
push	        rbp

mov     r8,   rdi           ;r15 = arg0
mov     r9,   rsi           ;r15 = arg0

push    rdi
mov     rdi,  r8
call    _ft_strlen
mov     r10,  rax
pop     rdi

push    rdi
mov     rdi,  r9
call    _ft_strlen
mov     r11,  rax
pop     rdi

mov     r12,  r10
add     r12,  r11

push    rdi
mov     rdi,  r12           ;arg0 = r14
call    _ft_strnew          ;call malloc
mov     r13,  rax           ;r10 = malloc(r14);
pop     rdi

mov     r14, 0

while:cmp r14 ,r10          ;while (r12 < r10)
      jge   endwhile        ;{
      mov al  ,[rdi + r14]  ;al = r9[0]
      mov [r13 + r14], al   ;r8[i] = r9

      inc r14               ;r9++;
      jmp while             ;}
endwhile:


mov     r15, 0

while2:cmp r14 ,r12         ;while (r12 < r10)
      jge   endwhile2       ;{
      mov al  ,[rsi + r15]  ;al = r9[0]
      mov [r13 + r14], al   ;r8[i] = r9

      inc r14
      inc r15              ;r9++;
      jmp while2           ;}
endwhile2:

mov     rax,  r13

pop           rbp
ret
