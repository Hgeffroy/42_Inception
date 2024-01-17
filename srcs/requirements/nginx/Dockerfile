FROM    debian:bookworm

RUN  apt update
RUN  apt install
RUN  apt install nginx -y
#RUN    apt install vim -y
#RUN    apt inctall curl -y

RUN  mkdir -p etc/nginx/ssl
RUN  apt install openssl -y
RUN  openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
                              -keyout /etc/nginx/ssl/inception.key \
                              -subj "/C=FR/L=Lyon/O=42/CN=hgeffroy.42.fr/UID=hgeffroy"

RUN  mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT  ["nginx", "-g", "daemon off;"]