FROM debian:bookworm

RUN apt update -y; \
    apt upgrade -y; \
    apt install nginx -y; \
    chown -R www-data:www-data /var/www/html

COPY --chmod=755 conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 8000

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# mkdir -p etc/nginx/ssl \
# apt install openssl -y \
# openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
#                          -keyout /etc/nginx/ssl/inception.key \
#                          -subj "/C=FR/L=Lyon/O=42/CN=hgeffroy.42.fr/UID=hgeffroy" \
# mkdir -p /var/run/nginx