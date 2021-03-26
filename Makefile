# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/24 16:52:40 by besellem          #+#    #+#              #
#    Updated: 2021/03/26 13:14:13 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MUTE		=	
NAME		=	libasm.a
MAIN_TEST	=	test

## Main srcs
SRCS_FOLDER	:=	srcs

SRCS		+=	$(SRCS_FOLDER)/ft_strlen.s
# SRCS		+=	$(SRCS_FOLDER)/ft_strcpy.s
# SRCS		+=	$(SRCS_FOLDER)/ft_strcmp.s
# SRCS		+=	$(SRCS_FOLDER)/ft_write.s
# SRCS		+=	$(SRCS_FOLDER)/ft_read.s
# SRCS		+=	$(SRCS_FOLDER)/ft_strdup.s

## Objects
OBJS		=	$(SRCS:.s=.o)

## Include
INC			=	-Iinc

## Commands
ASMCOMPIL	=	nasm
CC			=	clang
CFLAGS		=	-Wall -Wextra -Werror
LIBC		=	ar rc
RM			=	rm -f

# System check
UNAME		:=	$(shell uname)


ifeq ($(UNAME), Darwin)
.s.o:
			$(MUTE) nasm -fmacho64 -o $@ $?
endif

ifeq ($(UNAME), Linux)
.s.o:
			$(MUTE) nasm -felf64 -o $@ $?
endif

$(NAME):	$(OBJS)
			$(MUTE) $(LIBC) $(NAME) $(OBJS)

all:		$(NAME)

test:		$(NAME)
			$(MUTE) $(CC) $(CFLAGS) main.c -o $(MAIN_TEST) $(INC) -Iasm

clean:
			$(MUTE) $(RM) $(OBJS)

fclean:		clean
			$(MUTE) $(RM) $(NAME)
			$(MUTE) $(RM) $(MAIN_TEST)

re:			fclean all

.PHONY:		$(NAME) all clean fclean re
