FROM os/centos:latest
MAINTAINER "Fendy Heryanto" <fendy3002@yahoo.com>

WORKDIR "/tmp"
#download beanstalkd
RUN git clone git://github.com/kr/beanstalkd.git;\
    cd /tmp/beanstalkd;\
    make;\
    cp beanstalkd /usr/bin/beanstalkd;\
    mkdir /var/lib/beanstalkd;

ADD ./beanstalkd.sevice /etc/systemd/system/beanstalkd.service

WORKDIR "~"
EXPOSE 11300

VOLUME ["/storage"]
VOLUME ["/media"]
CMD ["/usr/bin/systemctl", "start", "beanstalkd"]
