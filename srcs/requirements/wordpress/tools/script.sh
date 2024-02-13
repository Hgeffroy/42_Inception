#!/bin/bash

sleep 10

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp core download --path=/var/www/html --allow-root
    wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb:3306 --path=/var/www/html --allow-root
    wp core install --url="$DOMAIN_NAME" --title="Inception" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMINPASS" --admin_email="$WP_ADMINMAIL" --skip-email --path=/var/www/html --allow-root
    wp user create --user-login="$WP_USER" --user-pass="$WP_USERPASS" --user-email="WP_USERMAIL" --path=/var/www/html --allow-root
fi

mkdir -p /run/php/
php-fpm7.4 -F
