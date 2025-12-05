FROM alpine:latest

# Update and patch Alpine to latest security updates
RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl ca-certificates && \
    rm -rf /var/cache/apk/*

ARG KUBECTL_VERSION=latest

# Download and install kubectl
RUN if [ "$KUBECTL_VERSION" = "latest" ]; then \
        KUBECTL_VERSION=$(curl -s https://dl.k8s.io/release/stable.txt); \
    fi && \
    curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" && \
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    rm kubectl.sha256

# Verify kubectl is in PATH and working
RUN kubectl version --client

CMD ["kubectl"]