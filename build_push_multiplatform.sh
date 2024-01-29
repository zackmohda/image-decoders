docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 -t camicroscope/image_decoders -f Dockerfile --push .
docker push camicroscope/image_decoders
