FROM alpine:3.20

# Install network utils
RUN apk add --no-cache bash curl wget iproute2 iputils net-tools bind-tools tcpdump busybox-extras openssl socat nmap

# Create non-root user
RUN adduser -D netuser
USER netuser
WORKDIR /home/netuser

CMD ["/bin/bash"]