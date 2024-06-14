# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mysql.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acrespy <acrespy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/15 14:54:39 by acrespy           #+#    #+#              #
#    Updated: 2023/05/16 15:01:53 by acrespy          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo "-> start"

service mariadb start
sleep 5
echo "-> fin start"

mysql < /mysql.sql
echo "-> fin .sql"

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "-> fin alter"

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
echo "-> fin flush"

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
echo "-> fin shutdown"

exec mysqld_safe
echo "-> fin exec"

