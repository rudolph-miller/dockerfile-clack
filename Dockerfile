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

###
# Caveat: Lack in Quicklisp dists is not loadable due to https://github.com/fukamachi/lack/commit/c0ead6f980c1eec2b276258f0ac5805347255ea9
###

RUN git clone https://github.com/fukamachi/lack $HOME/.roswell/local-projects/lack && \
    ros install clack && \
    cp $HOME/.roswell/bin/clackup /usr/local/bin/


################################################################
## qlot

RUN git clone https://github.com/fukamachi/qlot $HOME/.roswell/local-projects/qlot && \
    ros install qlot && \
    cp $HOME/.roswell/bin/qlot /usr/local/bin/


################################################################
## woo

RUN git clone https://github.com/fukamachi/woo $HOME/.roswell/local-projects/woo && \
    ros install woo && \
    $HOME/.roswell/bin/install-woo && \
    ros install woo && \
    cp $HOME/.roswell/bin/woo /usr/local/bin/
