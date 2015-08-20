FROM centos:centos7
MAINTAINER Rudolph Miller

################################################################
## ENV

ENV PATH $HOME/.roswell/bin:/usr/local/bin:$PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib

ENV autoconf_version="2.69" \
    automake_version="1.11" \
    nodejs_version="0.12.0" \
    libbcrypt_version="1.1"

################################################################
## yum

###
# Caveat: without remove iputils, yum -y update will be failed in CircleCI.
###

RUN yum -y remove iputils && \
    yum -y update && \
    yum clean all && \
    yum -y groupinstall 'Development tools'

RUN yum -y install \
  curl-devel \
  mysql-devel \
  libev


################################################################
## libmysqlclient_r.so

RUN cp /usr/lib64/mysql/libmysqlclient_r.so /usr/local/lib/libmysqlclient_r.so

################################################################
## autoconf

WORKDIR /usr/local/src
RUN curl http://ftp.gnu.org/gnu/autoconf/autoconf-${autoconf_version}.tar.gz | tar -xzv
WORKDIR /usr/local/src/autoconf-${autoconf_version}
RUN ./configure && \
    make && \
    make install


################################################################
## automake

WORKDIR /usr/local/src
RUN curl http://ftp.gnu.org/gnu/automake/automake-${automake_version}.tar.gz do | tar -xzv
WORKDIR /usr/local/src/automake-${automake_version}
RUN ./configure && \
    make && \
    make install


################################################################
## Roswell

WORKDIR /usr/local/src
RUN git clone -b release https://github.com/snmsts/roswell
WORKDIR /usr/local/src/roswell
RUN sh ./bootstrap && \
    ./configure && \
    make && \
    make install


################################################################
## Clack

RUN git clone https://github.com/fukamachi/clack $HOME/.roswell/local-projects/clack && \
    ros -e "(ql:quickload :clack)" && \
    ros install clack && \
    cp $HOME/.roswell/bin/clackup /usr/local/bin/


################################################################
## qlot

RUN git clone https://github.com/fukamachi/qlot $HOME/.roswell/local-projects/qlot && \
    ros install qlot && \
    cp $HOME/.roswell/bin/qlot /usr/local/bin/


################################################################
## Woo (make cache)

RUN git clone https://github.com/fukamachi/woo $HOME/.roswell/local-projects/woo && \
    ros -e "(ql:quickload :woo)"
