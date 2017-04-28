;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_putnbr.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .data
number       db          0

section .text
global _ft_putnbr

extern _ft_putchar
_ft_putnbr:                    ;function ft_putnbr(long int n){
push    rbp                    ;pile on the stack
push    rdi                    ;pile rdi
push    r10

ifnegative: cmp rdi      ,0    ;if (arg0 < 0) {
    jl  negative               ;negative(arg0);
afternegative:                 ;}

mov     r10      ,number       ;r10 = addr of number
mov     [r10 + 0],rdi          ;r10[0] = rdi

if: cmp rdi      ,10           ;if (arg0 <= 10){
    jge decremente             ;return decremente(arg0);
                               ;} else {
add     rdi     ,48            ;arg0 += 48
call    _ft_putchar            ;ft_putchar(arg0);

pop     r10
pop     rdi                    ;restore rdi
pop     rbp                    ;depile of the stack
ret                            ;return ; }

decremente:                    ;function decremente(arg0){
mov     r10      ,number       ;r10 = addr of number
mov     [r10 + 0],rdi          ;r10[0] = arg0
mov     eax      ,[r10 + 0]    ;eax = r10[0]
mov     ecx      ,10           ;ecx = 10
div     ecx                    ;eax = eax / ecx ; edx = eax % ecx
mov     [r10 + 0],eax          ;r10[0] = eax = eax / ecx;

push    rdi                    ;save rdi
mov     rdi      ,[r10 + 0]    ;rdi = r10[0]
call    _ft_putnbr             ;ft_putnbr(rdi);
pop     rdi                    ;restore rdi

mov     [r10 + 0],rdi          ;r10[0] = rdi
mov     eax      ,[r10 + 0]    ;eax = r10[0]
mov     ecx      ,10           ;ecx = 10
div     ecx                    ;eax = eax / ecx ; edx = eax % ecx
mov     [r10 + 0],edx          ;r10[0] = edx = eax % ecx;

push    rdi                    ;save rdi
mov     rdi      ,[r10 + 0]    ;arg0 = r10
add     rdi      ,48           ;arg0 += 48
call    _ft_putchar            ;ft_putchar(arg0);
pop     rdi                    ;restore rdi

pop     r10
pop     rdi                    ;restore rdi
pop     rbp                    ;depile of the stack
ret                            ;return ; }


negative:                      ;function negative(arg0) {
neg     rdi                    ;arg0 = -arg0
push    rdi                    ;save my arg0
mov     rdi      ,'-'          ;arg0 = '-'
call    _ft_putchar            ;ft_putchar('-');
pop     rdi                    ;restor my arg0
jmp     afternegative          ;return ; }
