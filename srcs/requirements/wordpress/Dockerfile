FROM debian:11

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install wget -y; \
    apt-get install php-fpm php-mysql mariadb-client -y

RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar && \
    chmod +x wp-cli-2.7.0.phar && \
    mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY --chmod=755 tools/script.sh /home/

ARG MARIADB_PASSWORD
ARG MARIADB_DATABASE
ARG DOMAIN_NAME
ARG MARIADB_USER
ARG WP_ADMIN
ARG WP_ADMINPASS
ARG WP_ADMINMAIL 
ARG WP_USER
ARG WP_USERPASS
ARG WP_USERMAIL

ENV MARIADB_PASSWORD MARIADB_PASSWORD
ENV MARIADB_DATABASE MARIADB_DATABASE
ENV DOMAIN_NAME DOMAIN_NAME
ENV MARIADB_USER MARIADB_USER
ENV WP_ADMIN WP_ADMIN
ENV WP_ADMINPASS WP_ADMINPASS
ENV WP_ADMINMAIL WP_ADMINMAIL
ENV WP_USER WP_USER
ENV WP_USERPASS WP_USERPASS
ENV WP_USERMAIL WP_USERMAIL

ENTRYPOINT ["home/script.sh"]
