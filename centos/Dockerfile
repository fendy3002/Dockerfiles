FROM centos:7
MAINTAINER "Fendy Heryanto" <fendy3002@gmail.com>
ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum remove -y epel-release;\
yum install -y epel-release;\
yum clean all && yum -y update;\
yum groupinstall -y "Development tools";\
yum install -y vim wget;\
yum install -y psmisc net-tools iproute;

VOLUME [ "/sys/fs/cgroup", "/tmp" ]
CMD ["/usr/sbin/init"]
