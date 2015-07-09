FROM rudolphm/clack:latest
MAINTAINER Rudolph Miller


################################################################
## app.lisp

ADD app.lisp /usr/local/src/clack-test/

ENTRYPOINT ["woo", "--port", "6000", "/usr/local/src/clack-test/app.lisp"]
EXPOSE 6000
