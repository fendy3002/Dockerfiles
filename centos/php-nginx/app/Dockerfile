FROM qz/php-nginx:latest
MAINTAINER "Fendy Heryanto" <fendy.heryanto@codersconoly.com>

#php config
ADD ./src/php.d/php.ini /etc/php.ini
ADD ./src/php.d/www.conf /etc/php-fpm.d/www.conf

#nginx config
ADD ./src/nginx.d/nginx.conf /etc/nginx/nginx.conf

#supervisor
RUN yum install -y supervisor
RUN mkdir /etc/supervisor.d\
    mkdir -p /home/storage/log\
    unlink /tmp/supervisor.sock
ADD ./src/supervisord.conf /etc/supervisord.conf

EXPOSE 80 22

VOLUME ["/var/www"]
VOLUME ["/etc/supervisor.d"]
CMD ["/usr/bin/supervisord", "-n"]
