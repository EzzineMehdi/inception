FROM debian:12

RUN apt-get update && apt-get install nginx -y

COPY ./conf/wordpress /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

CMD [ "nginx", "-g daemon off;" ]