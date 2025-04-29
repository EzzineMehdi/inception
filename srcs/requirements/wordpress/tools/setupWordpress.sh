#!/bin/bash

wp core download --allow-root

cp wp-config-sample.php wp-config.php

sed -ir "s/database_name_here/$MYSQL_DATABASE/1"  wp-config.php
sed -ir "s/username_here/$MYSQL_USER/1"  wp-config.php
sed -ir "s/password_here/$MYSQL_PASSWORD/1"  wp-config.php
sed -ir "s/localhost/mariadb/1" wp-config.php
sed -ir "s/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/1" /etc/php/8.2/fpm/pool.d/www.conf

# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

/usr/sbin/php-fpm8.2 -F