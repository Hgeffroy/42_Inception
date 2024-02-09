#!/bin/bash

echo "lala"

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp core download --path=/var/www/html --allow-root
    wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb:3306 --path=/var/www/html --allow-root
    wp core install --url="$DOMAIN_NAME" --title="Inception" --admin_user="$WP_USER" --admin_password="$WP_PASS" --admin_email="$WP_MAIL" --skip-email --path=/var/www/html --allow-root
fi

mkdir -p /run/php/ # ?
php-fpm7.4 -F
