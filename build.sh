#!/bin/bash

# Stop on errors
set -e

# Build the Docker image
docker-compose build

# Exit with success
exit 0

