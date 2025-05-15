FROM debian:12

RUN apt-get update -y && apt-get install -y vsftpd

CMD ["vsftpd", "/etc/vsftpd.conf"]