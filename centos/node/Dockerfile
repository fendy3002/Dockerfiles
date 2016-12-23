FROM os/centos:latest
MAINTAINER "Fendy Heryanto" <fendy3002@gmail.com>

#node npm gulp bower
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -;\
    yum -y install nodejs;\
    yum -y install gcc-c++ make;\
    npm install --global gulp-cli;\
    npm install bower -g;

#supervisor
RUN yum install -y supervisor
RUN mkdir /etc/supervisor.d\
    mkdir -p /home/storage/log\
    unlink /tmp/supervisor.sock

WORKDIR "~"

EXPOSE 80

VOLUME ["/storage"]
VOLUME ["/media"]
VOLUME ["/app"]

WORKDIR "/app"
CMD ["/usr/bin/npm", "start"]
