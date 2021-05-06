/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: besellem <besellem@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:36:39 by besellem          #+#    #+#             */
/*   Updated: 2021/05/06 11:55:55 by besellem         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <libc.h>
#include <errno.h>

#define RED "\e[1;31m"
#define GREEN "\e[1;32m"
#define CLR_COLOR "\e[0m"


// TEST FT_STRLEN
int		strlen_single_test(const char *str)
{
	size_t	my_len		= 0;
	size_t	real_len	= strlen(str);
	
	#if defined(__FT_STRLEN__)
	my_len = ft_strlen(str);
	#endif	/* defined(__FT_STRLEN__) */
	
	if (my_len == real_len)
		return (0);
	else
	{
		printf(RED "KO" CLR_COLOR "\n");
		return (1);
	}
}

int		test_strlen(void)
{
	int	ret = 0;

	ret += strlen_single_test("Hello");
	ret += strlen_single_test("");
	ret += strlen_single_test("Hello world !\nHow are you ?");
	return (ret);
}


// TEST FT_STRCMP
int		strcmp_single_test(const char *s1, const char *s2)
{
	const char	*_s1	= s1;
	const char	*_s2	= s2;
	int	my_diff			= 0;
	int	real_diff		= strcmp(_s1, _s2);
	
	#if defined(__FT_STRCMP__)
	my_diff = ft_strcmp(_s1, _s2);
	#endif	/* defined(__FT_STRCMP__) */
	
	if (my_diff == real_diff)
		return (0);
	else
	{
		printf(RED "KO => real_diff[%d] my_diff[%d]" CLR_COLOR "\n", real_diff, my_diff);
		return (1);
	}
}

int		test_strcmp(void)
{
	int	ret = 0;

	ret += strcmp_single_test("", "");
	ret += strcmp_single_test("Hello", "Hello");
	ret += strcmp_single_test("Hello world !\0 ?", "Hello world !\0 ?");
	ret += strcmp_single_test("Hello world !\0?", "Hello world !\0 ?");
	ret += strcmp_single_test("abc", "abd");
	ret += strcmp_single_test("abc", "aba");
	ret += strcmp_single_test("test here", "another test, why not ?");
	return (ret);
}


// TEST FT_WRITE
int		write_single_test(int fildes, const void *buf, size_t nbyte)
{
	ssize_t	my_ret		= 0;
	ssize_t	real_ret	= write(fildes, buf, nbyte);
	int		my_errno	= 0;
	int		real_errno	= errno;

	errno = 0;
	#if defined(__FT_WRITE__)
	my_ret = ft_write(fildes, buf, nbyte);
	my_errno = errno;
	errno = 0;
	#endif	/* defined(__FT_WRITE__) */
	
	(void)my_errno;
	(void)real_errno;
	// if (my_errno == real_errno) // Check errno
	// 	return (0);
	// else
	// {
	// 	printf(RED "KO => real_errno[%d] my_errno[%d]" CLR_COLOR "\n", real_errno, my_errno);
	// 	return (1);
	// }

	if (my_ret == real_ret) // Check length
		return (0);
	else
	{
		printf(RED "KO => real_ret[%zd] my_ret[%zd]" CLR_COLOR "\n", real_ret, my_ret);
		return (1);
	}
}

int		test_write(void)
{
	int	ret = 0;

	ret += write_single_test(STDERR_FILENO, "Hello", 5);
	ret += write_single_test(STDERR_FILENO, "", 0);
	ret += write_single_test(STDERR_FILENO, "Hello world ! How are you ?", 27);
	ret += write_single_test(234, "Hello", 5);
	ret += write_single_test(234, "Hello world ! How are you ?", 27);
	return (ret);
}


void	make_test(const char *func_name, int (*f)(void))
{
	if (f())
		printf(RED "Your %s is KO" CLR_COLOR "\n", func_name);
	else
		printf(GREEN "%s behave like the real one !" CLR_COLOR "\n", func_name);
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
	
	return (0);
}
