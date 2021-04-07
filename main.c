/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: besellem <besellem@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:36:39 by besellem          #+#    #+#             */
/*   Updated: 2021/04/07 01:57:49 by besellem         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libc.h>
#include <errno.h>
#include <libasm.h>

int	main(void)
{
	// asm(
	// 	".intel_syntax;"
	// 	"xor rcx, rcx;"
	// );
	// printf("errno: %d\n", errno);
	printf("Hello World\n");
	printf("ft_strlen(\"Hello World\\n\"): [%zu]\n", ft_strlen("Hello World\n"));
	return (0);
}
