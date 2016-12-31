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

#libsodium
RUN yum clean all && yum -y update;\
    yum install -y libsodium-devel;

#downloads
WORKDIR "/tmp"
#pthreads
RUN git clone https://github.com/krakjoe/pthreads.git pthreads;\
    cd /tmp/pthreads;\
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
    cp modules/libsodium.so /usr/lib64/php-zts/modules/.;\
    echo extension=libsodium.so > /etc/php-zts.d/libsodium.ini;

#php config
ADD ./src/php.d/php.ini /etc/php.ini

#supervisor
RUN yum install -y supervisor
RUN mkdir /etc/supervisor.d;\
    mkdir -p /storage/log/supervisor;

ADD ./src/supervisord.conf /etc/supervisord.conf

WORKDIR "~"

EXPOSE 80 22

VOLUME ["/storage",\
    "/var/www/html"]
CMD ["/usr/bin/supervisord", "-n"]
