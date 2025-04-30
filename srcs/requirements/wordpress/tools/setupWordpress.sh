#!/bin/bash

wp core download --allow-root

wp config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="mariadb" --allow-root

sed -ir "s/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/1" /etc/php/8.2/fpm/pool.d/www.conf

wp core install \
  --url="http://127.0.0.1:8000/" \
  --title="Example Site" \
  --admin_user=$MYSQL_USER \
  --admin_password=$MYSQL_PASSWORD \
  --admin_email=admin@example.com \
  --skip-email \
  --allow-root
wp user create user example@example.com --role=subscriber --user_pass=123456 --allow-root

# wp core install --url=localhost --title=title --admin_user=admin --admin_password=admin --admin_email=example@gmail.com --skip-email --allow-root
# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

/usr/sbin/php-fpm8.2 -F