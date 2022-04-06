FROM alpine:3.13

ARG VERSION
ARG TARGETPLATFORM

RUN apk add curl \
    && curl -LO "https://dl.k8s.io/release/$VERSION/bin/$TARGETPLATFORM/kubectl" \
    && apk del curl \
    && chmod +x kubectl \
    && mv kubectl /usr/bin

USER 1001
ENTRYPOINT ["kubectl"]
CMD ["help"]
