#!/bin/bash

COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_YELLOW="\033[1;33m"
COLOR_END="\033[0m"

CONTAINER_NAME="humble_22.04"

default()
{
  if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo
    echo
    echo -e "$COLOR_YELLOW ||    exec $CONTAINER_NAME    || $COLOR_END"
    echo 
    echo
    docker start $CONTAINER_NAME
    docker exec -it $CONTAINER_NAME bash
    exit 0
  fi

  echo
  echo
  echo -e "$COLOR_GREEN ||  first run $CONTAINER_NAME  || $COLOR_END"
  echo
  echo

  if [ ! -d "./files" ]; then
    mkdir -p ./files
  fi

  xhost +local:root
  docker run -it \
    --name="$CONTAINER_NAME" \
    --env ROS_MASTER_URI=http://$CONTAINER_NAME:11311 \
    --env ROS_IP=$CONTAINER_NAME \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --net=host \
    --privileged \
    --volume=/dev:/dev \
    --volume=/dev/bus/usb:/dev/bus/usb \
    --volume=/home/$USER/Desktop/Codes/dockers-workspace/$CONTAINER_NAME:/workspace \
    $CONTAINER_NAME \
    bash
}

remove()
{
  echo
  echo
  echo -e "$COLOR_RED ||   remove $CONTAINER_NAME   || $COLOR_END"
  echo
  echo
  docker stop $CONTAINER_NAME
  docker rm $CONTAINER_NAME
}

if [ $# -eq 0 ]; then
  default
fi

while getopts 'r' flag; do
  case "${flag}" in
    r)remove
      ;;
  esac
done