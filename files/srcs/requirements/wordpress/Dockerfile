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

RUN apt-get update -y && apt-get upgrade -y
#RUN apt-get install -y apt-utils dialog wget php php8.0 php-fpm php-mysql mariadb-client
RUN apt-get install -y apt-utils
RUN apt-get install -y readline-common
RUN apt-get install -y dialog
RUN apt-get install -y wget
RUN apt-get install -y php
RUN apt-get install -y php8.0
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.5.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.5.2-fr_FR.tar.gz && rm wordpress-6.5.2-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY	./conf/php.conf	/etc/php/8.0/fpm/pool.d/www.conf
COPY	./conf/wordpress.sh /wordpress.sh

ENTRYPOINT ["bash", "wordpress.sh"]