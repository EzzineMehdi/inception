FROM debian:12

RUN apt-get update -y && apt-get install -y redis-server

# RUN service redis-server start

RUN sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
RUN echo "\nport 6379" >>  /etc/redis/redis.conf
# RUN redis-cli CONFIG SET bind "0.0.0.0"
# redis-cli CONFIG REWRITE

# RUN service redis-server stop

CMD ["redis-server", "--protected-mode", "no"]
