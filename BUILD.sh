VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)

docker buildx build --platform linux/amd64,linux/arm64 \
-f Dockerfile \
-t stefangenov/kubectl:latest \
-t stefangenov/kubectl:"${VERSION}" \
--build-arg VERSION="${VERSION}" \
--cpu-quota="400000" \
--memory=16g \
--push .
