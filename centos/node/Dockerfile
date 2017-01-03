FROM os/centos:latest
MAINTAINER "Fendy Heryanto" <fendy3002@gmail.com>

#node npm gulp bower
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -;\
    yum -y install nodejs;\
    yum -y install gcc-c++ make;\
    npm install --global gulp-cli;\
    npm install --global supervisor;\
    npm install --global nodemon;\
    npm install bower --global;

#supervisor
RUN yum install -y supervisor
RUN mkdir /etc/supervisor.d;\
    mkdir -p /storage/log/supervisor;

ADD ./src/supervisord.conf /etc/supervisord.conf
ADD ./src/supervisor.d/npm.conf /etc/supervisor.d/npm.conf

WORKDIR "~"

EXPOSE 80 22

VOLUME ["/root/.ssh",\
    "/storage",\
    "/var/www/html"]

CMD ["/usr/bin/supervisord", "-n"]
