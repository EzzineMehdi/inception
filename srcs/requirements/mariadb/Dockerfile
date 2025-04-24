FROM debian:12

RUN apt-get update && apt-get install -y mariadb-server

RUN service mariadb start

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/setupDataBase.sh /root/
RUN chmod +x /root/setupDataBase.sh

CMD [ "/root/setupDataBase.sh" ]
