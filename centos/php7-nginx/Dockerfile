FROM os/centos:latest
MAINTAINER "Fendy Heryanto" <fendy3002@gmail.com>
ENV DOLLAR $

#php
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm;\
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm;\
yum clean all && yum -y update;\
yum install -y php71w-fpm php71w-opcache;\
yum install -y php71w-common;\
yum install -y php71w-devel\
    php71w-mbstring php71w-mysql php71w-pear\
    php71w-pdo php71w-xml php71w-xmlrpc;\
yum install -y php71w-mcrypt;

#composer
WORKDIR "/tmp"
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');";\
    php composer-setup.php;\
    php -r "unlink('composer-setup.php');";\
    mv composer.phar /usr/bin/composer;

#nginx libsodium
RUN yum clean all && yum -y update;\
    yum install -y nginx libsodium-devel;

#downloads
WORKDIR "/tmp"
#libsodium
RUN pecl channel-update pecl.php.net;\
    pecl download libsodium-1.0.6;\
    tar zxvf libsodium-1.0.6.tgz;\
    cd /tmp/libsodium-1.0.6;\
    phpize;\
    ./configure --with-php-config=/usr/bin/php-config;\
    make;\
    cp modules/libsodium.so /usr/lib64/php/modules/.;

#php config
ADD ./src/php.d/php.ini /etc/php.ini
ADD ./src/php.d/www.conf /etc/php-fpm.d/www.conf

#nginx config
RUN mkdir -p /storage/log/nginx
ADD ./src/nginx.d/nginx.conf /etc/nginx/nginx.conf
ADD ./src/nginx.d/default.template /etc/nginx/conf.d/default.template
ADD ./src/nginx.d/parse-nginx.sh /etc/nginx/conf.d/parse-nginx.sh

#supervisor
RUN yum install -y supervisor
RUN mkdir /etc/supervisor.d;\
    mkdir -p /storage/log/supervisor;

ADD ./src/supervisord.conf /etc/supervisord.conf
ADD ./src/supervisor.d/php_fpm.conf /etc/supervisor.d/php_fpm.conf
ADD ./src/supervisor.d/parse_nginx.conf /etc/supervisor.d/parse_nginx.conf
ADD ./src/supervisor.d/nginx.conf /etc/supervisor.d/nginx.conf

WORKDIR "~"

EXPOSE 80 22

VOLUME ["/root/.ssh",\
    "/storage",\
    "/var/www/html"]
CMD ["/usr/bin/supervisord", "-n"]
