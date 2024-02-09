FROM debian:11

RUN apt update -y; \
    apt upgrade -y; \
    apt install nginx -y; \
    chown -R www-data:www-data /var/www/html; \
    mkdir -p etc/nginx/ssl; \
    apt install openssl -y; \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
                            -keyout /etc/nginx/ssl/inception.key \
                            -subj "/C=FR/L=Lyon/O=42/CN=hgeffroy.42.fr/UID=hgeffroy"; \
    mkdir -p /var/run/nginx

COPY --chmod=755 conf/nginx.conf /etc/nginx/nginx.conf

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 443

ARG DOMAIN_NAME

ENV DOMAIN_NAME DOMAIN_NAME

ENTRYPOINT ["nginx", "-g", "daemon off;"]
