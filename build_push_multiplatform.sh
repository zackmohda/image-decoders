docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 -t camicroscope/image-decoders -f Dockerfile --push .
docker push camicroscope/image_decoders
