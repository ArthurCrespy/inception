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
RUN apt install -y apt-utils nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN	openssl req -x509 -days 365 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42Paris/CN=acrespy.42.fr/UID=acrespy"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]