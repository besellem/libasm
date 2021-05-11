/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: besellem <besellem@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:36:39 by besellem          #+#    #+#             */
/*   Updated: 2021/05/11 15:17:23 by besellem         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define RED			"\e[1;31m"
#define GREEN		"\e[1;32m"
#define BLUE		"\e[1;34m"
#define CLR_COLOR	"\e[0m"


////////////////////////////////////////////////////////////////////////////////
// STRLEN TEST
////////////////////////////////////////////////////////////////////////////////
#if defined(__FT_STRLEN__)
# define TST_FT_STRLEN(s)														\
	do {																		\
		size_t my_len = ft_strlen(s), real_len = strlen(s);						\
		if (my_len == real_len)	{												\
			printf("[" GREEN "OK" CLR_COLOR "]\n");								\
		} else {																\
			printf("[" RED "KO" CLR_COLOR "] => real[%zu], mine[%zu]\n",		\
					real_len, my_len);											\
		}																		\
	} while (0)
#else
# define TST_FT_STRLEN(s) ((void)s)
#endif	/* defined(__FT_STRLEN__) */


////////////////////////////////////////////////////////////////////////////////
// STRCPY TEST
////////////////////////////////////////////////////////////////////////////////
#if defined(__FT_STRCPY__)
# define STRCPY_BUF 100
# define TST_FT_STRCPY(s)														\
	do {																		\
		char	real_dst[STRCPY_BUF], my_dst[STRCPY_BUF];						\
		ft_strcpy(my_dst, s);													\
		strcpy(real_dst, s);													\
		if (0 == strcmp(real_dst, my_dst)) {									\
			printf("[" GREEN "OK" CLR_COLOR "]\n");								\
		} else {																\
			printf("[" RED "KO" CLR_COLOR "] => real_dst[%s] my_dst[%s]\n",		\
					real_dst, my_dst);											\
		}																		\
	} while (0)
#else
# define TST_FT_STRCPY(s) ((void)s)
#endif	/* defined(__FT_STRCPY__) */


////////////////////////////////////////////////////////////////////////////////
// STRCMP TEST
////////////////////////////////////////////////////////////////////////////////
#if defined(__FT_STRCMP__)
# define TST_FT_STRCMP(s1, s2)													\
	do {																		\
		const char *_s1	= s1;													\
		const char *_s2	= s2;													\
		int my_diff = ft_strcmp(_s1, _s2), real_diff = strcmp(_s1, _s2);		\
		if (my_diff == real_diff) {												\
			printf("[" GREEN "OK" CLR_COLOR "]\n");								\
		} else {																\
			printf("[" RED "KO" CLR_COLOR "] => real_diff[%d] my_diff[%d]\n",	\
					real_diff, my_diff);										\
		}																		\
	} while (0)
#else
# define TST_FT_STRCMP(s1, s2) ((void)s1)
#endif	/* defined(__FT_STRCMP__) */


////////////////////////////////////////////////////////////////////////////////
// WRITE TEST
////////////////////////////////////////////////////////////////////////////////
#if defined(__FT_WRITE__)
# define TST_FT_WRITE(fildes, buf, nbyte)										\
	do {																		\
		ssize_t	real_ret	= write(fildes, buf, nbyte);						\
		int		real_errno	= errno;											\
		errno = 0;																\
		ssize_t	my_ret = ft_write(fildes, buf, nbyte);							\
		int		my_errno = errno;												\
		errno = 0;																\
		if (my_ret == real_ret && my_errno == real_errno) {						\
			printf("[" GREEN "OK" CLR_COLOR "]\n");								\
		} else {																\
			printf("[" RED "KO" CLR_COLOR "] => "								\
					"real_ret[%zd] real_errno[%d]"								\
					"my_ret[%zd] my_errno[%d]\n",								\
					real_ret, real_errno, my_ret, my_errno);					\
		}																		\
	} while (0)
#else
# define TST_FT_WRITE(fildes, buf, nbyte) ((void)fildes)
#endif	/* defined(__FT_WRITE__) */


////////////////////////////////////////////////////////////////////////////////
// STRDUP TEST
////////////////////////////////////////////////////////////////////////////////
#if defined(__FT_STRDUP__)
# define TST_FT_STRDUP(s)														\
	do {																		\
		char *my_dst = ft_strdup(s), *real_dst = strdup(s);						\
		int diff = diff = strcmp(real_dst, my_dst);								\
		if (0 == diff) {														\
			printf("[" GREEN "OK" CLR_COLOR "]\n");								\
		} else {																\
			printf("[" RED "KO" CLR_COLOR "] => real_dst[%s] my_dst[%s]\n",		\
					real_dst, my_dst);											\
		}																		\
		if (real_dst) { free(real_dst); }										\
		if (my_dst) { free(my_dst); }											\
	} while (0)
#else
# define TST_FT_STRDUP(s) ((void)s)
#endif	/* defined(__FT_STRDUP__) */


////////////////////////////////////////////////////////////////////////////////
// FT_LIST_SIZE TEST
////////////////////////////////////////////////////////////////////////////////
#if defined(__FT_LIST_SIZE__)
# define TST_FT_LIST_SIZE(lst, size_expected)									\
	do {																		\
		int size = ft_list_size(lst);											\
		if (size == size_expected) {											\
			printf("[" GREEN "OK" CLR_COLOR "]\n");								\
		} else {																\
			printf("[" RED "KO" CLR_COLOR "] => expected[%d] got[%d]\n",		\
					size_expected, size);										\
		}																		\
	} while (0)
#else
# define TST_FT_LIST_SIZE(lst, size_expected) ((void)lst)
#endif	/* defined(__FT_LIST_SIZE__) */

// #ifndef __FT_STRDUP__
// # define __FT_STRDUP__
// #endif

void	test_strlen(void) {
	TST_FT_STRLEN("Hello");
	TST_FT_STRLEN("WHY NOT \0 ??");
	TST_FT_STRLEN("");
	TST_FT_STRLEN("Hello world !\nHow are you ?");
}

void	test_strcpy(void) {
	TST_FT_STRCPY("");
	TST_FT_STRCPY("Hello");
	TST_FT_STRCPY("Hello world !\0 ?");
	TST_FT_STRCPY("Hello world !\0?");
	TST_FT_STRCPY("abc");
	TST_FT_STRCPY("abc");
	TST_FT_STRCPY("test here");
}

void		test_strcmp(void) {
	TST_FT_STRCMP("", "");
	TST_FT_STRCMP("Hello", "Hello");
	TST_FT_STRCMP("Hello world !\0 ?", "Hello world !\0 ?");
	TST_FT_STRCMP("Hello world !\0?", "Hello world !\0 ?");
	TST_FT_STRCMP("abc", "abd");
	TST_FT_STRCMP("abc", "aba");
	TST_FT_STRCMP("abc", "zbc");
	TST_FT_STRCMP("test here", "another test, why not ?");
}

void		test_write(void) {
	TST_FT_WRITE(STDERR_FILENO, "Hello", 5);
	TST_FT_WRITE(STDERR_FILENO, "", 0);
	TST_FT_WRITE(STDERR_FILENO, "Hello world ! How are you ?", 27);
	TST_FT_WRITE(234, "Hello", 5);
	TST_FT_WRITE(234, "Hello world ! How are you ?", 27);
}


// TEST FT_READ
int		read_single_test(int fildes, void *buf, size_t nbyte)
{
	ssize_t	my_ret		= 0;
	ssize_t	real_ret	= read(fildes, buf, nbyte);
	int		my_errno	= 0;
	int		real_errno	= errno;

	errno = 0;
	#if defined(__FT_READ__)
	my_ret = ft_read(fildes, buf, nbyte);
	my_errno = errno;
	errno = 0;
	#endif	/* defined(__FT_READ__) */
	
	if (my_errno == real_errno) // Check errno
		return (0);
	else
	{
		printf(RED "KO => real_errno[%d] my_errno[%d]" CLR_COLOR "\n", real_errno, my_errno);
		return (1);
	}

	if (my_ret == real_ret) // Check length
		return (0);
	else
	{
		printf(RED "KO" CLR_COLOR " => real_ret[%zd] my_ret[%zd]\n", real_ret, my_ret);
		return (1);
	}
}

void		test_read(void) {
	read_single_test(STDERR_FILENO, "Hello", 5);
	read_single_test(STDERR_FILENO, "", 0);
	read_single_test(STDERR_FILENO, "Hello world ! How are you ?", 27);
	read_single_test(234, "Hello", 5);
	read_single_test(234, "Hello world ! How are you ?", 27);
}

void		test_strdup(void) {
	TST_FT_STRDUP("");
	TST_FT_STRDUP("Hello");
	TST_FT_STRDUP("Hello world !\0 ?");
	TST_FT_STRDUP("Hello world !\0?");
	TST_FT_STRDUP("abc");
	TST_FT_STRDUP("abc");
	TST_FT_STRDUP("test here");
}

#define ALLOC_LST() ((t_list *)calloc(1, sizeof(t_list)))	// return ptr allocated
void		test_list_size(void) {
	t_list	*lst = NULL;
	
	TST_FT_LIST_SIZE(lst, 0);
	
	lst = ALLOC_LST();
	lst->next = NULL;
	TST_FT_LIST_SIZE(lst, 1);

	lst->next = ALLOC_LST();
	lst->next->next = NULL;
	TST_FT_LIST_SIZE(lst, 2);
	
	lst->next->next = ALLOC_LST();
	lst->next->next->next = ALLOC_LST();
	lst->next->next->next->next = ALLOC_LST();
	lst->next->next->next->next->next = ALLOC_LST();
	lst->next->next->next->next->next->next = NULL;
	TST_FT_LIST_SIZE(lst, 6);
}

void	make_test(const char *func_name, void (*func)(void))
{
	printf(BLUE "# Testing %s..." CLR_COLOR "\n", func_name);
	func();
}


// (avoid write syscalls to be printed)
int		main(void)
{
	#if defined(__FT_STRLEN__)
	make_test("ft_strlen", &test_strlen);
	#endif	/* defined(__FT_STRLEN__) */

	#if defined(__FT_STRCPY__)
	make_test("ft_strcpy", &test_strcpy);
	#endif	/* defined(__FT_STRCPY__) */

	#if defined(__FT_STRCMP__)
	make_test("ft_strcmp", &test_strcmp);
	#endif	/* defined(__FT_STRCMP__) */
	
	#if defined(__FT_WRITE__)
	make_test("ft_write", &test_write);
	#endif	/* defined(__FT_WRITE__) */

	#if defined(__FT_READ__)
	make_test("ft_read", &test_read);
	#endif	/* defined(__FT_READ__) */

	#if defined(__FT_STRDUP__)
	make_test("ft_strdup", &test_strdup);
	#endif	/* defined(__FT_STRDUP__) */


	////////////////////////////////////
	// BONUS
	////////////////////////////////////

	#if defined(__FT_LIST_SIZE__)
	make_test("ft_list_size", &test_list_size);
	#endif	/* defined(__FT_LIST_SIZE__) */

	// ft_write(-1, "test", 1);
	
	return (0);
}
