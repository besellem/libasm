/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:36:39 by besellem          #+#    #+#             */
/*   Updated: 2021/04/07 10:06:53 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <errno.h>

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
