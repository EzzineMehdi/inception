#!/bin/bash
# sleep 10
if [ ! -f wp-config.php ]; then
	wp core download --allow-root

	wp config create \
	--dbname="$MYSQL_DATABASE" \
	--dbuser="$MYSQL_USER" \
	--dbpass="$MYSQL_PASSWORD" \
	--dbhost="$DB_HOST:$DB_HOST_PORT" \
	--allow-root

	wp core install \
	--url="http://127.0.0.1:8000/" \
	--title="$TITLE" \
	--admin_user="$ADMIN_USER" \
	--admin_password="$ADMIN_PASSWORD" \
	--admin_email=$ADMIN_EMAIL \
	--skip-email \
	--allow-root

	wp user create $USER $USER_EMAIL \
    --user_pass=$USER_PASSWORD \
    --allow-root
	#bonus
	wp config  set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    wp config  set WP_CACHE 'true' --allow-root
    wp plugin install redis-cache --allow-root
    wp plugin activate redis-cache --allow-root
    wp redis enable --allow-root

fi

# if ! wp user exists user --allow-root; then
#   wp user create user example@example.com \
#     --user_pass=123456 \
#     --allow-root
# else
#   echo "User 'user' already exists; skipping creation."
# fi

/usr/sbin/php-fpm8.2 -F