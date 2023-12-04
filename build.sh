#!/usr/bin/env bash

# Check if tags argument is provided
if [ -z "$1" ]; then
  echo "Please provide a comma-separated list of tags."
  exit 1
fi

# Split comma-separated tags into an array
IFS=',' read -ra TAGS <<< "$1"

# Iterate over tags
for TAG in "${TAGS[@]}"; do
  echo "Building and pushing image for tag: $TAG"
  
  docker buildx build \
    --push \
    --platform linux/arm64/v8,linux/amd64 \
    --build-arg LIBERICA_TAG="$TAG" \
    --tag "edgewoodsoftware/bellsoft-liberica-openjdk-debian-awscli:$TAG" \
    .
done
