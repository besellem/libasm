/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: besellem <besellem@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:37:55 by besellem          #+#    #+#             */
/*   Updated: 2021/04/06 17:05:40 by besellem         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <libc.h>

int				ft_strcmp(const char *s1, const char *s2);
char			*ft_strcpy(char *dst, const char *src);
char			*ft_strdup(const char *s1);
size_t			ft_strlen(const char *s);
ssize_t			ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t			ft_read(int fildes, void *buf, size_t nbyte);

typedef	struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

#endif
