;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_toupper.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_toupper

extern _ft_isupper
extern _ft_islower

_ft_toupper:
push          rbp
mov           r10, rdi      ;r10 = rdi(first args)

call _ft_isupper
cmp   rax, 1                ;if (ft_isupper(c) == 1)
je    end                   ;return (r10);

call _ft_islower
cmp   rax, 0                ;if (ft_islower(c) == 0)
je    end                   ;return (r10);

sub   r10, 32               ;r10 = r10 - 32

end:
mov           rax, r10      ;rax = rdi
pop           rbp
ret
