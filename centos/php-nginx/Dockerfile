FROM os/centos:latest
MAINTAINER "Fendy Heryanto" <fendy.heryanto@codersconoly.com>

#php
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm;\
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm;\
yum clean all && yum -y update;\
yum install -y php56w;\
yum install -y php56w-common;\
yum install -y php56w-fpm php56w-common php56w-devel\
    php56w-mbstring php56w-mysql php56w-pear\
    php56w-pdo php56w-xml php56w-xmlrpc;\
yum install -y php56w-mcrypt;

#nginx composer
RUN yum clean all && yum -y update;\
    yum install -y composer nginx libsodium-devel supervisor;\
    pecl install libsodium;

#mariadb client
ADD ./src/mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum -y install MariaDB-client

#downloads
WORKDIR "/tmp"
#pthreads
RUN pecl download pthreads-2.0.10;\
    tar zxvf pthreads-2.0.10.tgz;\
    cd /tmp/pthreads-2.0.10;\
    zts-phpize;\
    ./configure --with-php-config=/usr/bin/zts-php-config;\
    make;\
    cp modules/pthreads.so /usr/lib64/php-zts/modules/.;\
    echo extension=pthreads.so > /etc/php-zts.d/pthreads.ini;

#libsodium
RUN pecl download libsodium-1.0.5;\
    tar zxvf libsodium-1.0.5.tgz;\
    cd /tmp/libsodium-1.0.5;\
    zts-phpize;\
    ./configure --with-php-config=/usr/bin/zts-php-config;\
    make;\
    cp modules/libsodium.so /usr/lib64/php-zts/modules/.;

WORKDIR "~"

EXPOSE 80

VOLUME ["/storage"]
