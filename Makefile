# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jguyet <jguyet@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/03/25 15:18:38 by jguyet            #+#    #+#              #
#    Updated: 2017/03/19 04:49:16 by jguyet           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libfts.a

NAMEBASE    =   $(shell basename $(NAME) .a)

LENGTHNAME	=	`printf "%s" $(NAMEBASE) | wc -c`

MAX_COLS	=	$$(echo "$$(tput cols)-20-$(LENGTHNAME)"|bc)

CC			=	gcc

NASM		= ~/.brew/Cellar/nasm/2.12.02/bin/nasm -f macho64

TOLIB		= ar rc

INDEXLIB = ranlib

SRCDIR		=	srcs/

OBJDIR		=	.objs/

SRCBASE		=	\
						ft_bzero.s																													\
						ft_islower.s																												\
						ft_isupper.s																												\
						ft_isalpha.s																												\
						ft_isalnum.s																												\
						ft_isdigit.s																												\
						ft_isprint.s																												\
						ft_isascii.s																												\
						ft_puts.s																														\
						ft_tolower.s																												\
						ft_toupper.s																												\
						ft_strcat.s																													\
						ft_strlen.s


SRCS		=	$(addprefix $(SRCDIR), $(SRCBASE))

OBJS		=	$(addprefix $(OBJDIR), $(SRCBASE:.s=.o))

.SILENT:

all:
	if test -f $(NAME) ; then																											\
		echo "make: Nothing to be done for \`all\`.";																\
	else																																					\
		$(MAKE) -j $(NAME);																													\
	fi
$(NAME):	$(OBJDIR) $(OBJS)
	$(TOLIB) $(NAME) $(OBJS)
	$(INDEXLIB) $(NAME)
	echo "MAKE   [$(NAMEBASE)]"

$(OBJDIR):
	mkdir -p $(OBJDIR)
	mkdir -p $(dir $(OBJS))

$(OBJDIR)%.o : $(SRCDIR)%.s | $(OBJDIR)
	$(NASM) $< -o $@
	printf "\r\033[38;5;117m%s%*.*s\033[0m\033[K"																	\
	"MAKE   "$(NAMEBASE)" plz wait ..."																						\
		$(MAX_COLS) $(MAX_COLS) "($(@)))"

clean:
	if [[ `rm -R $(OBJDIR) &> /dev/null 2>&1; echo $$?` == "0" ]]; then						\
		echo -en "\r\033[38;5;101mCLEAN  "																					\
		"[\033[0m$(NAMEBASE)\033[38;5;101m]\033[K";																	\
	else																																					\
		printf "\r";																																\
	fi

fclean:		clean
	if [[ `rm $(NAME) &> /dev/null 2>&1; echo $$?` == "0" ]]; then								\
		echo -en "\r\033[38;5;124mFCLEAN "																					\
		"[\033[0m$(NAMEBASE)\033[38;5;124m]\033[K";																	\
	else																																					\
		printf "\r";																																\
	fi

re:			fclean all

all2:
	if test -f $(NAME) ; then																											\
		cd .																																				\
	else																																					\
		$(MAKE) -j $(NAME);																													\
	fi

test: all2
	gcc maintest.c $(OBJS) -I includes/ -L . -lfts -o test
	./test

.PHONY: all clean fclean re
