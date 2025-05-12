FROM debian:12

RUN apt-get update -y && apt-get install -y redis-server #redis

# RUN sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
RUN redis-cli CONFIG SET bind "0.0.0.0"

CMD ["redis-server", "--protected-mode", "no"]
