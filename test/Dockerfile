FROM rudolphm/clack:latest
MAINTAINER Rudolph Miller


################################################################
## app.lisp

ADD app.lisp /usr/local/src/clack-test/

CMD clackup --port 6000 --server woo /usr/local/src/clack-test/app.lisp
EXPOSE 6000
