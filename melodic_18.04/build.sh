#!/bin/bash

CONTAINER_NAME="melodic"

if [[ "$1" == "-r" ]]; then
    echo "Removing Docker image: $CONTAINER_NAME"
    sudo docker rmi -f $CONTAINER_NAME
    exit 0
fi

sudo docker build -t $CONTAINER_NAME .