#!/bin/bash

# Stop on errors
set -e

# Name of the Docker image
IMAGE_NAME=my-react-app

# Docker hub username
DOCKER_USERNAME=raghavanp08

# Docker hub password
DOCKER_PASSWORD=909262Ra@

# Docker hub repository
DOCKER_REPOSITORY=raghavanp08/capstone_project

# Build the Docker image
docker-compose build

# Login to Docker hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag the Docker image with the repository name
docker tag $IMAGE_NAME $DOCKER_REPOSITORY

# Push the Docker image to Docker hub
docker push $DOCKER_REPOSITORY

# SSH into the server
ssh user@server.com << EOF

# Pull the Docker image from Docker hub
docker pull $DOCKER_REPOSITORY

# Stop and remove the existing Docker container
docker stop $IMAGE_NAME || true && docker rm $IMAGE_NAME || true

# Run a new Docker container with the updated image
docker run -d --restart=always --name $IMAGE_NAME -p 80:80 $DOCKER_REPOSITORY

EOF

# Exit with success
exit 0

