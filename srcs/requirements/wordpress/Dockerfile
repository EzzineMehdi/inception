FROM debian:12

RUN apt-get update && apt-get install -y wget php8.2-fpm php-mysql mariadb-client vim

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp

