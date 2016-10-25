FROM os/centos:latest
MAINTAINER "Fendy Heryanto" <fendy3002@yahoo.com>

WORKDIR "/tmp"
#redis
RUN wget http://download.redis.io/releases/redis-3.0.7.tar.gz;\
    tar xzf redis-3.0.7.tar.gz;\
    cd /tmp/redis-3.0.7;\
    make;\
    mv /tmp/redis-3.0.7 /etc/redis;

ADD ./redis.sevice /etc/systemd/system/redis.service

EXPOSE 6379
WORKDIR "~"

VOLUME ["/storage"]
CMD ["/etc/redis/src/redis-server"]
