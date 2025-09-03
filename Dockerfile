FROM alpine:3.21.4

# Install specific versions of network utilities
RUN apk update && apk add --no-cache curl=8.15.0-r1

# Create a non-root user
RUN adduser -D netuser
USER netuser
WORKDIR /home/netuser

CMD ["/bin/sh"]