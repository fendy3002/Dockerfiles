FROM centos:7
MAINTAINER "Fendy Heryanto" <fendy3002@gmail.com>
ENV container docker

RUN mkdir /docker;\
    mkdir /docker/db;\
    mkdir /docker/projects;\
    mkdir /docker/storage;\
    mkdir /docker/nginx-conf;\
    mkdir /docker/supervisor;\
    mkdir /host;

VOLUME [ "/docker",\
    "/docker/db",\
    "/docker/projects",\
    "/docker/storage",\
    "/docker/nginx-conf",\
    "/docker/supervisor",\
    "/docker/host"];

CMD ["/usr/sbin/init"]
