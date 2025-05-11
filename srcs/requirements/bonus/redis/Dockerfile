FROM debian:12

RUN apt-get update -y && apt-get install -y redis redis-server

RUN sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]