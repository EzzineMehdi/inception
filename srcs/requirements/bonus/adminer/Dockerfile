FROM debian:12

RUN apt-get update && apt-get install -y adminer

RUN sed -i '1i\ServerName localhost' /etc/apache2/apache2.conf

RUN a2enconf adminer.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]