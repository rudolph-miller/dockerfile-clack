FROM rudolphm/clack:latest
MAINTAINER Rudolph Miller


################################################################
## app.lisp

ADD app.lisp /usr/local/src/sample/

ENTRYPOINT ["woo", "--port", "80", "/usr/local/src/sample/app.lisp"]
EXPOSE 80
