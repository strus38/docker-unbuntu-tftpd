FROM ubuntu:18.04

RUN apt-get update && apt-get -y  dist-upgrade
RUN apt-get install supervisor tftpd-hpa -y

ADD supervisord.conf /etc/supervisor/
RUN adduser -D tftp && mkdir -p /tftp && chown tftp:tftp /tftp

VOLUME /tftp
EXPOSE 69/udp

CMD ["/usr/bin/supervisord"]