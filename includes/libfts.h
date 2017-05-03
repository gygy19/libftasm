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

/*
**Part 1 Fonctions simples de la libc
*/
void		    ft_bzero(void *s, int n);
char	     *ft_strcat(char *s1, const char *s2);
int					ft_isalpha(int c);
int					ft_isdigit(int c);
int					ft_isalnum(int c);
int					ft_isascii(int c);
int					ft_isprint(int c);
int					ft_toupper(int c);
int					ft_tolower(int c);
int         ft_puts(const char*s);

/*
**Part 2 Fonctions simples mais un peu moins de la libc
*/
int         ft_strlen(const char *s);
void	     *ft_memset(void *b, int c, int len);
void	     *ft_memcpy(void *dest, void const *src, int n);
char		   *ft_strdup(const char *s1);

/*
**Part 3 Cat
*/
void        ft_cat(unsigned int fd);

/*
**Bonus
*/
char		   *ft_strndup(const char *s1, int n);
int					ft_islower(int c);
int					ft_isupper(int c);
void        ft_putstr(const char *str);
void        ft_putchar(char c);
char			  *ft_strnew(int c);
char			  *ft_strjoin(char *s1, char *s2);

#endif
