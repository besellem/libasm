# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/24 16:52:40 by besellem          #+#    #+#              #
#    Updated: 2021/05/06 11:16:35 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MUTE		=	
NAME		=	libasm.a
MAIN_TEST	=	test

## Main srcs
SRCS_FOLDER	:=	srcs

SRCS		+=	$(SRCS_FOLDER)/ft_strlen.s
# SRCS		+=	$(SRCS_FOLDER)/ft_strcpy.s
SRCS		+=	$(SRCS_FOLDER)/ft_strcmp.s
SRCS		+=	$(SRCS_FOLDER)/ft_write.s
# SRCS		+=	$(SRCS_FOLDER)/ft_read.s
# SRCS		+=	$(SRCS_FOLDER)/ft_strdup.s

## Objects
OBJS		=	$(SRCS:.s=.o)

## Include
INC			=	-Iinc -L. -lasm

## Defines (for tests)
DEFINES		+=	-D__FT_STRLEN__
# DEFINES		+=	-D__FT_STRCPY__
DEFINES		+=	-D__FT_STRCMP__
DEFINES		+=	-D__FT_WRITE__
# DEFINES		+=	-D__FT_READ__
# DEFINES		+=	-D__FT_STRDUP__


## Commands
ASMCOMPIL	=	nasm
CC			=	clang
CFLAGS		=	-Wall -Wextra -Werror# -fsanitize=address
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
			$(MUTE) $(CC) $(CFLAGS) $(DEFINES) main.c -o $(MAIN_TEST) $(INC)
			clear && ./$(MAIN_TEST) 2>/dev/null

clean:
			$(MUTE) $(RM) $(OBJS)

fclean:		clean
			$(MUTE) $(RM) $(NAME)
			$(MUTE) $(RM) $(MAIN_TEST)

re:			fclean all

.PHONY:		$(NAME) all clean fclean re
