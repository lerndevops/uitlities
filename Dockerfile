FROM alpine:3.20

# Install specific versions of network utilities
RUN apk update && apk add --no-cache curl=8.12.1-r0

# Create a non-root user
RUN adduser -D netuser
USER netuser
WORKDIR /home/netuser

CMD ["/bin/sh"]