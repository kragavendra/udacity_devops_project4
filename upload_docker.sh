#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=kragavendra1100/predictions-app

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username kragavendra1100
docker tag predictions-app $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath