#!/bin/bash

echo 'anonymous_enable=NO' >> /etc/vsftpd.conf
echo 'local_enable=YES' >> /etc/vsftpd.conf
echo 'write_enable=YES' >> /etc/vsftpd.conf
echo 'chroot_local_user=YES' >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "pasv_min_port=4000" >> /etc/vsftpd.conf
echo "pasv_max_port=4005" >> /etc/vsftpd.conf
echo "file_open_mode=0777" >> /etc/vsftpd.conf

adduser $FTP_USER --home /var/www/wordpress
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

chown -R "$FTP_USER:$FTP_USER" /var/www/wordpress

vsftpd /etc/vsftpd.conf