# Start with Alpine
FROM alpine:3.20

# Install common network utilities
RUN apk add --no-cache \
    bash \
    curl \
    wget \
    iproute2 \
    iputils \
    net-tools \
    bind-tools \
    tcpdump \
    busybox-extras \
    openssl \
    socat \
    nmap

# Default command: open a shell
CMD ["/bin/bash"]