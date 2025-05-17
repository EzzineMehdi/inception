FROM debian:12

RUN apt-get update -y && apt-get install -y vsftpd

COPY tools/script.sh /

RUN chmod +x /script.sh

RUN /script.sh

RUN rm -rf /script.sh

CMD ["vsftpd", "/etc/vsftpd.conf"]