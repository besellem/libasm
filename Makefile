# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: besellem <besellem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/24 16:52:40 by besellem          #+#    #+#              #
#    Updated: 2021/05/12 11:39:32 by besellem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MUTE		=	@
NAME		=	libasm.a
MAIN_TEST	=	test

## Main srcs
SRCS_FOLDER	:=	srcs

SRCS		+=	$(SRCS_FOLDER)/ft_strlen.s
SRCS		+=	$(SRCS_FOLDER)/ft_strcpy.s
SRCS		+=	$(SRCS_FOLDER)/ft_strcmp.s
SRCS		+=	$(SRCS_FOLDER)/ft_write.s
SRCS		+=	$(SRCS_FOLDER)/ft_read.s
SRCS		+=	$(SRCS_FOLDER)/ft_strdup.s
SRCS		+=	$(SRCS_FOLDER)/ft_list_size.s
SRCS		+=	$(SRCS_FOLDER)/ft_list_push_front.s

## Objects
OBJS		=	$(SRCS:.s=.o)

## Include
INC			=	-L. -lasm -Iinc

## Defines (for tests)
DEFINES			+=	-D__FT_STRLEN__
DEFINES			+=	-D__FT_STRCPY__
DEFINES			+=	-D__FT_STRCMP__
DEFINES			+=	-D__FT_WRITE__
DEFINES			+=	-D__FT_READ__
DEFINES			+=	-D__FT_STRDUP__

BONUS_DEFINES	+=	-D_BONUS_
BONUS_DEFINES	+=	-D__FT_LIST_SIZE__
BONUS_DEFINES	+=	-D__FT_LIST_PUSH_FRONT__


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
			$(MUTE) $(ASMCOMPIL) -fmacho64 -o $@ $?
endif

ifeq ($(UNAME), Linux)
.s.o:
			$(MUTE) $(ASMCOMPIL) -felf64 -o $@ $? -D__LINUX__
endif


ifeq ($(UNAME), Linux)
$(NAME):	$(OBJS)
			$(MUTE) $(LIBC) $(NAME) $(OBJS)
endif

ifeq ($(UNAME), Darwin)
$(NAME):	$(OBJS)
			$(MUTE) $(LIBC) $(NAME) $(OBJS)
endif


all:		$(NAME)

bonus:		all

test:		$(NAME)
			$(MUTE) $(CC) $(CFLAGS) $(DEFINES) -o $(MAIN_TEST) $(OBJS) main.c $(INC)
			$(MUTE) clear
			@ ./$(MAIN_TEST) 2>/dev/null

bonus_test:	$(NAME)
			$(MUTE) $(CC) $(CFLAGS) $(BONUS_DEFINES) -o $(MAIN_TEST) $(OBJS) main.c $(INC)
			$(MUTE) clear
			@ ./$(MAIN_TEST) 2>/dev/null

clean:
			$(MUTE) $(RM) $(OBJS)

fclean:		clean
			$(MUTE) $(RM) $(NAME)
			$(MUTE) $(RM) $(MAIN_TEST)


re:			fclean all

.PHONY:		$(NAME) all bonus clean fclean re
