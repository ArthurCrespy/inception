#!/bin/sh

if [ ! -d /var/www/wordpress ]
then
  mkdir -p /var/www/wordpress
  wp core download --allow-root --path='/var/www/wordpress'
fi

if [ ! -e /var/www/wordpress/wp-config.php ]
then
  wp config create --allow-root --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --dbhost=mariadb:3306 --path='/var/www/wordpress'
  sleep 10
  wp core install --allow-root --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USER}" --admin_password="${WP_ADMIN_PASSWORD}" --admin_email="${WP_ADMIN_EMAIL}" --path='/var/www/wordpress'
  wp user create --allow-root --role=author "${WP_USER_USER}" "${WP_USER_EMAIL}" --user_pass="${WP_USER_PASS}" --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]
then
    mkdir -p /run/php
fi

php-fpm8.2 -F
