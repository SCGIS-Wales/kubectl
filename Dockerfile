# Stage 1: Fetch and validate kubectl binary
FROM alpine:latest AS builder

# Download and validate kubectl
ARG KUBECTL_VERSION=latest
RUN if [ "$KUBECTL_VERSION" = "latest" ]; then \
        KUBECTL_VERSION=$(wget -qO- https://dl.k8s.io/release/stable.txt); \
    fi && \
    wget -O kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    wget -O kubectl.sha256 "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" && \
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c && \
    chmod +x kubectl && \
    rm kubectl.sha256

# Verify kubectl is working
RUN ./kubectl version --client

# Stage 2: Minimal final image with only kubectl binary
FROM scratch

# Copy only the kubectl binary from builder stage
COPY --from=builder --chown=0:0 /kubectl /kubectl

# Set kubectl as entrypoint
ENTRYPOINT ["/kubectl"]