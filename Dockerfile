FROM golang:1.16.7-alpine3.14

WORKDIR /app

RUN /bin/bash -c 'pwd ; ls -Al'

COPY simple-httpd .

RUN /bin/bash -c 'ls -Al'

ENTRYPOINT [ "./simple-httpd" ]
