/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: besellem <besellem@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:36:39 by besellem          #+#    #+#             */
/*   Updated: 2021/04/27 00:37:48 by besellem         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <libc.h>
#include <errno.h>

#define RED "\e[1;31m"
#define GREEN "\e[1;32m"
#define CLR_COLOR "\e[0m"


#if defined(__FT_STRLEN__)
int	strlen_single_test(const char *str)
{
	size_t	my_len;
	size_t	real_len;

	real_len = strlen(str);
	my_len = ft_strlen(str);
	if (my_len == real_len)
		return (0);
	else
	{
		printf(RED "KO" CLR_COLOR "\n");
		return (1);
	}
}

int	test_strlen(void)
{
	int	ret = 0;

	ret += strlen_single_test("Hello");
	ret += strlen_single_test("");
	ret += strlen_single_test("Hello world !\nHow are you ?");
	return (ret);
}
#endif	/* defined(__FT_STRLEN__) */


// #define __FT_WRITE__
#if defined(__FT_WRITE__)
int	write_single_test(int fildes, const void *buf, size_t nbyte)
{
	ssize_t	my_len;
	ssize_t	real_len;

	real_len = write(fildes, buf, nbyte);
	my_len = ft_write(fildes, buf, nbyte);
	if (my_len == real_len)
		return (0);
	else
	{
		printf(RED "KO => %zu %zu" CLR_COLOR "\n", my_len, real_len);
		return (1);
	}
}

int	test_write(void)
{
	int	ret = 0;

	ret += write_single_test(STDERR_FILENO, "Hello", 5);
	ret += write_single_test(STDERR_FILENO, "", 0);
	ret += write_single_test(STDERR_FILENO, "Hello world ! How are you ?", 27);
	return (ret);
}
#endif	/* defined(__FT_WRITE__) */


// to run like this => ./test 2>/dev/null
// (avoid write syscalls to be printed)
int	main(void)
{
	#if defined(__FT_STRLEN__)
	if (test_strlen() == 0)
		printf(GREEN "ft_strlen behave like the real one !" CLR_COLOR "\n");
	else
		printf(RED "Your ft_strlen is KO" CLR_COLOR "\n");
	#endif	/* defined(__FT_STRLEN__) */
	
	#if defined(__FT_WRITE__)
	if (test_write() == 0)
		printf(GREEN "ft_write behave like the real one !" CLR_COLOR "\n");
	else
		printf(RED "Your ft_write is KO" CLR_COLOR "\n");
	#endif	/* defined(__FT_WRITE__) */
	
	return (0);
}
