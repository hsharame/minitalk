/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hsharame <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/18 10:21:34 by hsharame          #+#    #+#             */
/*   Updated: 2024/09/18 10:21:36 by hsharame         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int	g_count;

char	ft_bintoa(char *bits)
{
	int	value;
	int	i;

	value = 0;
	i = 0;
	if (ft_strlen(bits) != 8)
		return (0);
	while (i < 8)
	{
		value <<= 1;
		if (bits[i] == '1')
			value |= 1;
		i++;
	}
	return ((char)value);
}

void	signal_handler(int sign, siginfo_t *info, void *contexte)
{
	static char	bits[9];
	char		value;
	int			end;

	(void)contexte;
	end = 0;
	if (sign == SIGUSR1)
		bits[g_count] = '1';
	else if (sign == SIGUSR2)
		bits[g_count] = '0';
	g_count++;
	if (g_count == 8)
	{
		bits[8] = '\0';
		value = ft_bintoa(bits);
		if (value == '\0')
			end = 1;
		ft_printf("%c", value);
		g_count = 0;
	}
	if (end)
	{
		kill(info->si_pid, SIGUSR1);
		end = 0;
	}
}

int	main(void)
{
	struct sigaction	signal;

	ft_printf("Hello! The server welcomes you!\n");
	ft_printf("The process ID is %d\n", getpid());
	sigemptyset(&signal.sa_mask);
	signal.sa_sigaction = signal_handler;
	signal.sa_flags = SA_SIGINFO;
	sigaction(SIGUSR1, &signal, NULL);
	sigaction(SIGUSR2, &signal, NULL);
	while (1)
		pause();
	return (0);
}
