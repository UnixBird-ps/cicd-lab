FROM golang:1.16.7-alpine3.14

WORKDIR /app

RUN /bin/sh -c 'pwd ; ls -Al'

COPY simple-httpd .

RUN /bin/sh -c 'ls -Al'

ENTRYPOINT [ "./simple-httpd" ]
