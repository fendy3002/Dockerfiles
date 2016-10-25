FROM os/centos:latest
MAINTAINER "Fendy Heryanto" <fendy3002@yahoo.com>

ADD ./src/mariadb.repo /etc/yum.repos.d/mariadb.repo
RUN yum -y install MariaDB-server MariaDB-client
ADD ./src/my.cnf /etc/my.cnf.d/server.cnf

VOLUME ["/var/lib/mysql"]
CMD ["mysqld", "--user=root"]
