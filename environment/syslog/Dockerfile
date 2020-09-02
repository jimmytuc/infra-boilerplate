FROM alpine:3.11

RUN apk add --update syslog-ng
ADD config/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf
RUN mkdir -p /app/logs/

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
