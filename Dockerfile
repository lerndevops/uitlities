FROM alpine:3.21.4

# Install specific versions of network utilities
RUN apk update && apk add --no-cache \
    curl \
    # iputils=20250605-r0 \
    # iproute2=5.19.0-r0 \
    # net-tools=1.60.20221130-r0 \
    # bind-tools=9.18.15-r0 \
    # tcpdump=4.9.0-r0 \
    # busybox-extras=1.36.1-r29 \
    # openssl=3.3.2-r3 \
    # nmap=7.94-r0

# Create a non-root user
RUN adduser -D netuser
USER netuser
WORKDIR /home/netuser

CMD ["/bin/sh"]