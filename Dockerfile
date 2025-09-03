FROM alpine:3.21.4

# Install specific versions of network utilities
RUN apk update && apk add --no-cache \
    curl=8.14.1-r1 \
    iputils=20240905-r0 \
    iproute2=6.15.0-r0 \
    net-tools=2.10-r3 \
    bind-tools=9.20.12-r0 \
    tcpdump=4.99.5-r1 \
    nmap=7.97-r0 \
    openssl \
    busybox-extras

# Create a non-root user for safer container execution
RUN adduser -D netuser
USER netuser
WORKDIR /home/netuser

CMD ["/bin/sh"]