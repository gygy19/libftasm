;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_strcat.s                                        :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_strcat

_ft_strcat:
push  rbp
mov   r15       ,rdi
mov   r10       ,rdi          ;r10 = rdi(dest)
mov   r11       ,rsi          ;r11 = rsi(src)

;move to end pointer of dest
while:
        mov al, [r10]         ;al = r10[0]
        cmp al, 0             ;while (r10[i] != 0) {
        je  endwhile          ;
        inc r10               ;r10++;move to next pointer
        jmp while             ;}
endwhile:

;add src to dest
while2:
        mov al, [r11]         ;al = r11[i]
        cmp al, 0             ;while (r11[i] != 0) {
        je  endwhile2         ;

        mov [r10 + 0], al
        inc r10               ;r10++;move to next pointer
        inc r11               ;r11++;move to next pointer
        jmp while2            ;}
endwhile2:

;add '\0' to dest
mov al        ,0              ;al = '\0'
mov byte[r10] ,al             ;r10[0] = al('\0')

mov   rax       ,r15          ;result = dest
pop   rbp
ret
