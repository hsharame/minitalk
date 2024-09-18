# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hsharame <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/12 15:51:56 by hsharame          #+#    #+#              #
#    Updated: 2024/09/12 15:51:59 by hsharame         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAMES		= server
NAMEC		= client
NAMESB		= server_bonus
NAMECB		= client_bonus
SRCSS		= server.c 
SRCSC		= client.c
SRCSSB		= server_bonus.c 
SRCSCB		= client_bonus.c
OBJSS		= $(SRCSS:.c=.o)
OBJSC		= $(SRCSC:.c=.o)
OBJSSB		= $(SRCSSB:.c=.o)
OBJSCB		= $(SRCSCB:.c=.o)
CC			= gcc
RM			= rm -f
CFLAGS		= -Wall -Wextra -Werror
LDFLAGS		= -no-pie
INCLUDES	= -I./libft -I./ft_printf
LIBFT		= ./libft/libft.a
PRINTF		= ./ft_printf/printf.a

all: $(NAMEC) $(NAMES)

$(NAMES): $(LIBFT) $(PRINTF) $(OBJSS)
		$(CC) $(CFLAGS) -o $(NAMES) $(OBJSS) $(LIBFT) $(PRINTF) $(INCLUDES) $(LDFLAGS)

$(NAMEC): $(LIBFT) $(PRINTF) $(OBJSC)
		$(CC) $(CFLAGS) -o $(NAMEC) $(OBJSC) $(LIBFT) $(PRINTF) $(INCLUDES)

$(LIBFT):
		make -C ./libft

$(PRINTF):
		make -C ./ft_printf

%.o: %.c
	cc $(FLAGS) -c $< -o $@ -I $(INCLUDES)

bonus: $(NAMECB) $(NAMESB)

$(NAMESB): $(LIBFT) $(PRINTF) $(OBJSSB)
		$(CC) $(CFLAGS) -o $(NAMESB) $(OBJSSB) $(LIBFT) $(PRINTF) $(INCLUDES) $(LDFLAGS)

$(NAMECB): $(LIBFT) $(PRINTF) $(OBJSCB)
		$(CC) $(CFLAGS) -o $(NAMECB) $(OBJSCB) $(LIBFT) $(PRINTF) $(INCLUDES)

clean:
		$(RM) $(OBJSS) $(OBJSC) $(OBJSSB) $(OBJSCB)
		make -C ./libft clean
		make -C ./ft_printf clean

fclean: clean
		$(RM) $(NAMEC) $(NAMES) $(NAMECB) $(NAMESB)
		make -C ./libft fclean
		make -C ./ft_printf fclean

re: fclean all

./PHONY: all bonus clean fclean re