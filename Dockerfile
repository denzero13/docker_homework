FROM alpine:latest

RUN apk --no-cache add netcat-openbsd

WORKDIR /scripts
CMD ["/bin/sh"]

