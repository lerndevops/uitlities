FROM alpine:3.22

# Install specific versions of network utilities
RUN apk update && apk add --no-cache \
    curl \
    iputils \
    iproute2 \
    net-tools \
    bind-tools \
    tcpdump \
    nmap \
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


CMD ["/bin/sh", "-c", "sleep 6000"]
