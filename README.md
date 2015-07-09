# Dockerfile-Clack - Dockerfile for Clack.
[![Build Status](https://circleci.com/gh/Rudolph-Miller/dockerfile-clack.svg?style=shield)](https://circleci.com/gh/Rudolph-Miller/dockerfile-clack)

## Usage

```
FROM rudolphm/clack:latest
MAINTAINER Rudolph Miller


ADD app.lisp /usr/local/src/sample/

ENTRYPOINT ["woo", "--port", "80", "/usr/local/src/sample/app.lisp"]
EXPOSE 80
```

## Author

* Rudolph Miller

## Copyright

Copyright (c) 2015 Rudolph Miller

## License

Licensed under the MIT License.
