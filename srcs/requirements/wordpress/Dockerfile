FROM debian:bookworm

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install curl; \
    apt-get install tar; \
    apt-get install php-fpm php-mysql mariadb-client -y;

COPY conf/wp-config.php /var/www/html/$DOMAIN_NAME/public_html/wp-config.php
COPY --chmod=755 tools/script.sh /home/

EXPOSE 9000

ENTRYPOINT [ "home/script.sh" ]
