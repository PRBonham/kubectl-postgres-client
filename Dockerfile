

ARG PG_VERSION=
ARG KUBE_VERSION=

FROM bitnami/kubectl:${KUBE_VERSION} as bitnami_kubectl

FROM alpine:3.18

COPY --from=bitnami_kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

# The edge repo is required to install kubectl
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --no-cache add postgresql${PG_VERSION}-client ca-certificates && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "psql" ]

USER 70
