# kubectl Alpine Docker Image

Lightweight Alpine-based Docker image with kubectl pre-installed. Automatically built weekly with the latest security patches and last 3 major kubectl versions.

## Features

- ✅ Based on Alpine Linux (latest)
- ✅ Weekly security updates and patches (every Friday at 19:30 UTC)
- ✅ Last 3 major kubectl versions maintained
- ✅ SHA256 verification of kubectl binaries
- ✅ Minimal size
- ✅ Published to GitHub Container Registry

## Usage

```bash
# Pull specific version
docker pull ghcr.io/<your-username>/kubectl:v1.33.6

# Run kubectl commands
docker run --rm ghcr.io/<your-username>/kubectl:v1.33.6 version --client

# Interactive shell
docker run -it --rm ghcr.io/<your-username>/kubectl:v1.33.6 sh

# Use in Kubernetes job
docker run --rm -v ~/.kube:/root/.kube ghcr.io/<your-username>/kubectl:v1.33.6 get pods
```

## Available Tags

Images are available with the following tags:
- `v1.33.6` - Specific patch version
- `v1.33` - Latest patch of v1.33 (auto-updated weekly)
- `latest` - Latest kubectl version available

## Weekly Releases

Every Friday at 19:30 UTC, a new release is created with:
- Updated container images with latest Alpine security patches
- `kubectl-versions.json` containing published versions
- Release notes with image tags and usage instructions

### kubectl-versions.json Format

```json
{
  "updated": "2025-12-05T19:30:00Z",
  "versions": ["v1.34.2", "v1.33.6", "v1.32.10"],
  "images": [
    "ghcr.io/<username>/kubectl:v1.34.2",
    "ghcr.io/<username>/kubectl:v1.33.6",
    "ghcr.io/<username>/kubectl:v1.32.10"
  ]
}
```

## Building Locally

```bash
# Build with specific kubectl version
docker build --build-arg KUBECTL_VERSION=v1.33.6 -t kubectl:v1.33.6 .

# Build with latest kubectl
docker build -t kubectl:latest .
```

## Security

- Alpine base image is updated and patched on every build
- kubectl binaries are verified with SHA256 checksums
- Weekly automated rebuilds ensure latest security patches
- Images are scanned for vulnerabilities

## License

MIT