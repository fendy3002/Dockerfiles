FROM ubuntu:latest
MAINTAINER "Fendy Heryanto" <fendy3002@gmail.com>
ENV DOLLAR $

RUN apt-get update;\
    apt-get install --assume-yes software-properties-common;

#php
RUN apt install --assume-yes apache2;\
    apt install --assume-yes php libapache2-mod-php php-mcrypt php-mysql;\
    update-rc.d apache2 defaults;

#composer
#WORKDIR "/tmp"
#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');";\
#    php composer-setup.php;\
#    php -r "unlink('composer-setup.php');";\
#    mv composer.phar /usr/bin/composer;

ADD ./src/composer /usr/bin/composer;

ADD ./src/php.d/php.ini /etc/php/7.0/apache2/php.ini
ADD ./src/apache2.conf /etc/apache2/apache2.conf
ADD ./src/sites-available/dev.local.conf /etc/apache2/sites-available/dev.local.conf

RUN a2ensite dev.local.conf;\
    a2enmod rewrite;

#supervisor
RUN apt-get install --assume-yes supervisor
RUN mkdir /etc/supervisor.d;\
    mkdir -p /storage/log/supervisor;

ADD ./src/supervisord.conf /etc/supervisord.conf
ADD ./src/supervisor.d/apache.conf /etc/supervisor.d/apache.conf

WORKDIR "/root"

EXPOSE 80 22

VOLUME ["/root/.ssh",\
    "/root/.composer/vendor",\
    "/storage",\
    "/var/www/html"]
CMD ["/usr/bin/supervisord", "-n"]
