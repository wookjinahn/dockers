#!/bin/bash

CONTAINER_NAME="melodic_18.04"

if [[ "$1" == "-r" ]]; then
    echo "Removing Docker image: $CONTAINER_NAME"
    docker rmi -f $CONTAINER_NAME
    exit 0
fi

docker build -t $CONTAINER_NAME .