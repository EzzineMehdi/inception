FROM debian:12

RUN apt-get update && apt-get install nginx openssl -y

COPY ./conf/wordpress /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

RUN openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=US/ST=State/L=City/O=Example Org/OU=IT/CN=example.com"

CMD [ "nginx", "-g daemon off;" ]