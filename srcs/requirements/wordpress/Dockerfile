FROM debian:12

RUN apt-get update && apt-get install -y php8.2-fpm php-mysql mariadb-client curl php-redis

WORKDIR /var/html/www/wordpress

# RUN wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp

COPY ./tools/setupWordpress.sh /root/
RUN chmod +x /root/setupWordpress.sh

RUN sed -ir "s/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/1" /etc/php/8.2/fpm/pool.d/www.conf

CMD [ "/root/setupWordpress.sh" ]