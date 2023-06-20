# GitHub Action for building and pushing a Docker image.

The action builds a Docker image, with support for multi-platform images, and pushing the image to a specified registry.

To achieve this, the action utilizes the following:

- [docker/login-action](https://github.com/docker/login-action)
- [docker/build-push-action](https://github.com/docker/build-push-action)
- [docker/setup-qemu-action](https://github.com/docker/setup-qemu-action)

## Usage

```yaml
- uses: evoy-as/.github/.github/actions/docker-buildx@main
  with:
    # Defaults to type=gha.
    cache-from: ""
    # Defaults to type=gha,mode=max.
    cache-to: ""
    # Defaults to .
    context: "."
    # Path to the Dockerfile. Defaults to {context}/Dockerfile.
    file: "../Dockerfile"
    # Defaults to false.
    push: true
    # List of target platforms for build.
    platforms: "linux/amd64,linux/arm64"
    # The name of the repository that the image should be pushed to. Defaults to acrevoy.azurecr.io.
    registry: ""
    # The login password for the registry. Required if push=true.
    registry-password: ""
    # The login username for the registry. Required if push=true.
    registry-username: ""
    # The name of the repository that the image should be pushed to. Required if push=true.
    repository: ""
    # List of tags
    tags: "latest,v1.2.3"
```

### Example of building an image for evoy-dashboard

Example of building and image for AMD64, ARM32 and ARM64 and pushing it to the repository `acrevoy.azurecr.io/evoy-dashboard`.

```yaml
- uses: evoy-as/.github/.github/actions/docker-buildx@main
  with:
    push: true
    platforms: "linux/amd64,linux/arm32,linux/arm64"
    registry-password: ${{ secrets.ACR_USERNAME }}
    registry-username: ${{ secrets.ACR_PASSWORD }}
    repository: "evoy-dashboard"
    tags: latest,v1,v1.2
```
