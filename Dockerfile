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
    busybox-extras \
    tar

RUN apk add --no-cache bash \
 && CRICTL_VERSION="1.31.1" \
 && ARCH=$(uname -m | sed 's/x86_64/amd64/' | sed 's/aarch64/arm64/') \
 && curl -L https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-${ARCH}.tar.gz -o crictl.tar.gz \
 && tar zxvf crictl.tar.gz -C /usr/local/bin \
 && rm -f crictl.tar.gz \
 && chmod +x /usr/local/bin/crictl

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
