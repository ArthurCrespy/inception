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

FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y apt-utils wget sendmail php7.4 php-fpm php-mysql mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod 755 /usr/local/bin/wp

COPY ./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/wordpress.sh /wordpress.sh

CMD ["bash", "wordpress.sh"]