ARG PG_VERSION=

FROM alpine:3.18

# The edge repo is required to install kubectl
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --no-cache add postgresql${PG_VERSION}-client ca-certificates kubectl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "psql" ]

USER 70
