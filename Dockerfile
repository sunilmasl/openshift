FROM docker.io/centos
RUN yum install httpd  -y
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
COPY src/ /war/www/html/
RUN chown apache:apache /var/run/httpd /var/log/httpd
RUN chmod -R 777 /var/run/httpd /var/log/httpd
EXPOSE 8080
USER apache
CMD ["/user/sbin/httpd", "-D", "FOREGROUND"]

