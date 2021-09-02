FROM alpine:3.12
LABEL maintainer="daniel@cloudtips.io"

ENV IP 127.0.0.1
ENV PORT 0

RUN apk add --no-cache \
    iptables \
    socat \
    ;

COPY run.sh /usr/bin

CMD run.sh $IP $PORT
