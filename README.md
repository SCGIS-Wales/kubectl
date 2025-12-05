# kubectl Alpine Docker Image

Lightweight Alpine-based Docker image with kubectl pre-installed. Automatically built weekly with the latest security patches and last 3 major kubectl versions.

## Features

- Based on Alpine Linux (latest)
- Weekly security updates and patches
- Last 3 major kubectl versions maintained
- Multi-architecture support
- Minimal size
- SHA256 verification of kubectl binaries

## Usage

```bash
# Pull specific version
docker pull <your-dockerhub-username>/kubectl:v1.33.6

# Run kubectl commands
docker run --rm <your-dockerhub-username>/kubectl:v1.33.6 version --client

# Interactive shell
docker run -it --rm <your-dockerhub-username>/kubectl:v1.33.6 sh
```

## Available Tags

- `v1.33.x` - Latest patch of v1.33
- `v1.32.x` - Latest patch of v1.32
- `v1.31.x` - Latest patch of v1.31
- `v1.33` - Points to latest v1.33.x
- `v1.32` - Points to latest v1.32.x
- `v1.31` - Points to latest v1.31.x

## GitHub Secrets Required

Set these secrets in your GitHub repository:

- `DOCKERHUB_USERNAME` - Your Docker Hub username
- `DOCKERHUB_TOKEN` - Docker Hub access token

## Build Schedule

Images are automatically rebuilt:
- Every Sunday at 2 AM UTC
- Can be triggered manually via workflow_dispatch

## Security

Alpine base image is updated and patched on every build to ensure latest security fixes.