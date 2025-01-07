

ARG KUBE_VERSION=

FROM bitnami/kubectl:${KUBE_VERSION} as bitnami_kubectl

FROM alpine:latest

COPY --from=bitnami_kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

# The edge repo is required to install kubectl
RUN apk --no-cache add postgresql-client ca-certificates && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "psql" ]

USER 70
