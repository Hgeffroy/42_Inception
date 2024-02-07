#!/bin/bash

sleep 10;

curl -L -O http://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
mv wordpress/* /var/www/html/$DOMAIN_NAME/public_html
cat /var/www/html/$DOMAIN_NAME/public_html/wp-config-sample.php