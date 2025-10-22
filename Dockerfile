FROM alpine:3.22

# Install specific versions of network utilities
RUN apk update && apk add --no-cache \
    curl=8.14.1-r1 \
    iputils=20240905-r0 \
    iproute2=6.15.0-r0 \
    net-tools=2.10-r3 \
    bind-tools=9.20.13-r0 \
    tcpdump=4.99.5-r1 \
    nmap=7.97-r0 \
    openssl \
    libcap \
    busybox-extras

# Create a non-root user for safer container execution
RUN adduser -S netuser -G root
#RUN usermod -aG netuser $USER
#RUN chgrp pcap /usr/bin/tcpdump
RUN chmod -R 777 /usr/bin/*
#RUN chown -R netuser:root /usr/bin/*
RUN setcap cap_net_raw,cap_net_admin=eip /usr/bin/tcpdump
#USER netuser
WORKDIR /home/netuser


CMD ["/bin/sh"]