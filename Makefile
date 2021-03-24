# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/24 16:52:40 by besellem          #+#    #+#              #
#    Updated: 2021/03/24 17:03:51 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MUTE		=	
NAME		=	libasm.a

## Main srcs
SRCS_FOLDER	:=	srcs

SRCS		+=	$(SRCS_FOLDER)/ft_strlen.s \
				$(SRCS_FOLDER)/ft_strcpy.s \
				$(SRCS_FOLDER)/ft_strcmp.s \
				$(SRCS_FOLDER)/ft_write.s \
				$(SRCS_FOLDER)/ft_read.s \
				$(SRCS_FOLDER)/ft_strdup.s 

## Objects
OBJS		=	$(SRCS:.s=.o)

## Include
INCS		=	-Iinc

## Commands
CC			=	clang
CFLAGS		=	-Wall -Wextra -Werror
LIBC		=	ar rc
RM			=	rm -f

.s.o:
			$(MUTE) $(CC) $(CFLAGS) -c $< -o $(<:.s=.o) $(INCS)

$(NAME):	$(OBJS)
			$(MUTE) $(LIBC) $(NAME) $(OBJS)

all:		$(NAME)

test:
			$(MUTE) $(CC) $(CFLAGS) main.c -Lasm $(INCS)

clean:
			$(MUTE) $(RM) $(OBJS)

fclean:		clean
			$(MUTE) $(RM) $(NAME)

re:			fclean all

.PHONY:		$(NAME) all clean fclean re
