# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acrespy <acrespy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/15 14:54:39 by acrespy           #+#    #+#              #
#    Updated: 2023/05/16 15:01:53 by acrespy          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
  wp config create --allow-root --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost=mariadb:3306 --path='/var/www/wordpress'
  sleep 10
  wp core install --url="$DOMAIN_NAME" --title=WP_TITLE --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root --path='/var/www/wordpress'
  wp user create --allow-root --role=author $WP_USER_USER $WP_USER_EMAIL --user_pass="$WP_USER_PASS" --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi

php-fpm8.2 -F