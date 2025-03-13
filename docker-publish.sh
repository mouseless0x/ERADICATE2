#!/bin/bash

# Exit on error
set -e

# Variables
IMAGE_NAME="mousless/eradicate2"
VERSION="1.0.0"

# Build the Docker image
echo "Building Docker image: $IMAGE_NAME:$VERSION"
docker build -t $IMAGE_NAME:$VERSION .
docker tag $IMAGE_NAME:$VERSION $IMAGE_NAME:latest

# Push to Docker Hub
echo "Pushing to Docker Hub"
docker push $IMAGE_NAME:$VERSION
docker push $IMAGE_NAME:latest

echo "Successfully published $IMAGE_NAME:$VERSION to Docker Hub"