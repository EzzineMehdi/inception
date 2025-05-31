FROM debian:12

RUN apt-get update && apt-get install nginx openssl -y

COPY ./conf/wordpress /etc/nginx/sites-available/

COPY ./conf/nginx-selfsigned.crt /etc/ssl/certs/
COPY ./conf/nginx-selfsigned.key /etc/ssl/private/

RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

# RUN openssl req -x509 -nodes -days 365 \
# 	-newkey rsa:2048 \
# 	-keyout nginx-selfsigned.key \
# 	-out nginx-selfsigned.crt \
# 	-subj "/C=MA/ST=Marrakesh-Safi/L=Ben Guerir/O=Example Org/OU=IT/CN=example.com"

CMD [ "nginx", "-g daemon off;" ]