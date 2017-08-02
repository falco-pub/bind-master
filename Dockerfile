FROM alpine:3.6
RUN apk add --no-cache bind bind-tools rsyslog bash supervisor

COPY /etc/bind/* /etc/bind/
COPY /etc/* /etc/

COPY run.sh .
RUN chmod +x run.sh

EXPOSE 53
EXPOSE 53/udp

VOLUME /var/log
VOLUME /dns

CMD ["./run.sh"]


