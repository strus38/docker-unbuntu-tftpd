FROM ubuntu:18.04

RUN apt-get update && apt-get -y  dist-upgrade
RUN apt-get install supervisor tftpd-hpa -y

RUN mkdir -p /tftp && chown tftp:tftp /tftp

VOLUME /tftp
EXPOSE 69/udp

ADD scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

ADD tftpd.conf /etc/supervisor/conf.d/tftpd.conf

CMD ["/bin/bash","/root/start.sh"]