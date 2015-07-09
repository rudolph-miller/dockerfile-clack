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

RUN yum -y remove iputils && \ # without this, yum -y update will be failed in CircleCI.
    yum -y update && \
    yum clean all && \
    yum -y groupinstall 'Development tools'

RUN yum -y install \
  sudo \
  curl-devel \
  mysql-devel \
  libev


################################################################
## sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers


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
## roswell

WORKDIR /usr/local/src
RUN git clone -b release https://github.com/snmsts/roswell
WORKDIR /usr/local/src/roswell
RUN sh ./bootstrap && \
    ./configure && \
    make && \
    make install


################################################################
## clack

RUN git clone https://github.com/fukamachi/lack $HOME/.roswell/impls/ALL/ALL/quicklisp/local-projects/lack && \
    ros install clack


################################################################
## qlot

RUN git clone https://github.com/fukamachi/qlot $HOME/.roswell/impls/ALL/ALL/quicklisp/local-projects/qlot && \
    ros install qlot


################################################################
## woo

RUN git clone https://github.com/fukamachi/woo $HOME/.roswell/impls/ALL/ALL/quicklisp/local-projects/woo && \
    ros install woo && \
    $HOME/.roswell/bin/install-woo
