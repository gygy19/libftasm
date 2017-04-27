;/* ************************************************************************** */
;/*                                                                            */
;/*                                                        :::      ::::::::   */
;/*   ft_tolower.s                                       :+:      :+:    :+:   */
;/*                                                    +:+ +:+         +:+     */
;/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
;/*                                                +#+#+#+#+#+   +#+           */
;/*   Created: 2017/04/27 02:33:07 by jguyet            #+#    #+#             */
;/*                                                    ###   ########.fr       */
;/*                                                                            */
;/* ************************************************************************** */
section .text
global _ft_tolower

extern _ft_isupper
extern _ft_islower

_ft_tolower:
push          rbp
;mov           r10, rdi      ;r10 = rdi(first args)

call _ft_islower
cmp   rax, 1                ;if (ft_islower(c) == 1)
je    end                   ;return (r10);

call _ft_isupper
cmp   rax, 0                ;if (ft_isupper(c) == 0)
je    end                   ;return (r10);

add   rdi, 32               ;r10 = r10 + 32

end:
mov           rax, rdi      ;rax = rdi
pop           rbp
ret
