FROM os/centos:latest
MAINTAINER "Fendy Heryanto" <fendy3002@gmail.com>

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
    php -r "unlink('composer-setup.php');"\
    mv composer.phar /usr/local/bin/composer;

#nginx libsodium
RUN yum clean all && yum -y update;\
    yum install -y nginx libsodium-devel supervisor;

#mariadb client
ADD ./src/mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum -y install MariaDB-client

#downloads
WORKDIR "/tmp"
#pthreads
RUN pecl channel-update pecl.php.net;\
    pecl download pthreads-3.1.6;\
    tar zxvf pthreads-3.1.6.tgz;\
    cd /tmp/pthreads-3.1.6;\
    zts-phpize;\
    ./configure --with-php-config=/usr/bin/zts-php-config;\
    make;\
    cp modules/pthreads.so /usr/lib64/php-zts/modules/.;\
    echo extension=pthreads.so > /etc/php-zts.d/pthreads.ini;

#libsodium
RUN pecl channel-update pecl.php.net;\
    pecl download libsodium-1.0.6;\
    tar zxvf libsodium-1.0.6.tgz;\
    cd /tmp/libsodium-1.0.6;\
    zts-phpize;\
    ./configure --with-php-config=/usr/bin/zts-php-config;\
    make;\
    cp modules/libsodium.so /usr/lib64/php-zts/modules/.;

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

WORKDIR "~"

EXPOSE 80 22

VOLUME ["/storage",\
    "/var/www/html",\
    "/etc/nginx/conf.d",\
    "/etc/supervisor.d"]
CMD ["/usr/bin/supervisord", "-n"]