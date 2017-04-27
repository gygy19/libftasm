/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/04/26 20:40:31 by jguyet            #+#    #+#             */
/*   Updated: 2017/04/26 20:40:32 by jguyet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H

int         ft_puts(const char*);
int         ft_strlen(const char *);
void		    ft_bzero(void *s, int n);
int					ft_islower(int c);
int					ft_isupper(int c);
int					ft_isalpha(int c);
int					ft_isdigit(int c);
int					ft_isalnum(int c);
int					ft_isascii(int c);
int					ft_isprint(int c);
int					ft_toupper(int c);
int					ft_tolower(int c);
char	     *ft_strcat(char *s1, const char *s2);
void	     *ft_memset(void *b, int c, int len);
void	     *ft_memcpy(void *dest, void const *src, int n);
char		   *ft_strdup(const char *s1);

#endif
