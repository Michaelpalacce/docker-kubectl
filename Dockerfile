FROM debian:stable-slim

ARG VERSION
ARG TARGETPLATFORM

RUN apt update && \
    apt install -y curl && \
    curl -LO "https://dl.k8s.io/release/$VERSION/bin/$TARGETPLATFORM/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/bin

USER 1001
ENTRYPOINT ["kubectl"]
CMD ["help"]
