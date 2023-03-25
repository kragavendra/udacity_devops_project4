#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
USERID=kragavendra1100
IMAGE=predictions-app
dockerpath=$USERID/$IMAGE

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $IMAGE --image=$USERID/$IMAGE --port=80
# Added logic for wait till the pod is created  
sleep 180
kubectl wait --for=condition=ready pods/$IMAGE

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $IMAGE 8000:80
