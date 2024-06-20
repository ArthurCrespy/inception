# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acrespy <acrespy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/15 14:54:39 by acrespy           #+#    #+#              #
#    Updated: 2023/05/16 15:01:53 by acrespy          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install -y apt-utils mariadb-server

COPY ./conf/mysql.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/mysql.sql /mysql.sql
COPY ./conf/mysql.sh /mysql.sh

EXPOSE 3306

ENTRYPOINT ["bash", "mysql.sh"]