#!/bin/bash

COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_YELLOW="\033[1;33m"
COLOR_END="\033[0m"

CONTAINER_NAME="noetic"

default()
{
  if [ "$(sudo docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo
    echo
    echo -e "$COLOR_YELLOW ----------------------- $COLOR_END"
    echo -e "$COLOR_YELLOW ||    exec noetic    || $COLOR_END"
    echo -e "$COLOR_YELLOW ----------------------- $COLOR_END"
    echo
    echo
    sudo docker start $CONTAINER_NAME
    sudo docker exec -it $CONTAINER_NAME bash
    exit 0
  fi

  echo
  echo
  echo -e "$COLOR_GREEN ------------------------ $COLOR_END"
  echo -e "$COLOR_GREEN ||  first run noetic  || $COLOR_END"
  echo -e "$COLOR_GREEN ------------------------ $COLOR_END"
  echo
  echo

  if [ ! -d "./files" ]; then
    mkdir -p ./files
  fi

  xhost +local:root
  sudo docker run -it \
    --name="$CONTAINER_NAME" \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --net=host \
    --privileged \
    --volume=/dev:/dev \
    --volume=/dev/bus/usb:/dev/bus/usb \
    --volume=./files:/files \
     noetic \
     bash
}

remove()
{
  echo
  echo
  echo -e "$COLOR_RED ----------------------- $COLOR_END"
  echo -e "$COLOR_RED ||   remove noetic   || $COLOR_END"
  echo -e "$COLOR_RED ----------------------- $COLOR_END"
  echo
  echo
  sudo docker stop $CONTAINER_NAME
  sudo docker rm $CONTAINER_NAME
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