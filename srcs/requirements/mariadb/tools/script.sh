#!/bin/bash

service mariadb start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE}; \
          CREATE USER IF NOT EXISTS ${MARIADB_USER}@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}'; \
          GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO ${MARIADB_USER}@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}'; \
          ALTER USER root@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}'; \
          FLUSH PRIVILEGES;"

mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown
exec mysqld_safe
