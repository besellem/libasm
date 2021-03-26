/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: besellem <besellem@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:36:39 by besellem          #+#    #+#             */
/*   Updated: 2021/03/26 13:31:20 by besellem         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libc.h>
#include <errno.h>
#include "libasm.h"

int	main(void)
{
	asm(
		".intel_syntax;"
		"xor rcx, rcx;"
	);
	printf("errno: %d\n", errno);
	// ft_strlen("Hello");
	printf("Hello World\n");
	return (0);
}
