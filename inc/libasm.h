/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: besellem <besellem@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:37:55 by besellem          #+#    #+#             */
/*   Updated: 2021/03/24 17:05:06 by besellem         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

size_t			ft_strlen(const char *s);
char			*ft_strcpy(char *dst, const char *src);
int				ft_strcmp(const char *s1, const char *s2);
ssize_t			ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t			ft_read(int fildes, void *buf, size_t nbyte);
char			*ft_strdup(const char *s1);

typedef	struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

#endif
