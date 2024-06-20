# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acrespy <acrespy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/15 14:54:39 by acrespy           #+#    #+#              #
#    Updated: 2023/05/16 15:01:53 by acrespy          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DATA	= $(HOME)/data
COMPOSE	= ./srcs/docker-compose.yml

all:
	@mkdir -p ${DATA}
	@mkdir -p ${DATA}/wordpress ${DATA}/mariadb
	@sudo docker-compose -f ${COMPOSE} up -d --build
	${info STATUS : Making...}

stop:
	@sudo docker-compose -f ${COMPOSE} stop
	${info STATUS : Stopping...}

clean: stop
	@sudo docker-compose -f ${COMPOSE} down -v
	${info STATUS : Cleaning...}

fclean: clean
	@sudo rm -rf ${DATA}/wordpress ${DATA}/mariadb
	@sudo rm -rf ${DATA}
	@sudo docker system prune -af
	${info STATUS : Full Cleaning...}

re: clean all

.PHONY: all stop clean fclean re
.SILENT: all stop clean fclean re
