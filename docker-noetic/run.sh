#!/bin/bash

COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_END="\033[0m"

echo
echo
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN ||    run noetic     || $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo
echo

default()
{
  xhost +local:root
  sudo docker run -it \
     --name="noetic"\
     --env="DISPLAY" \
     --env="QT_X11_NO_MITSHM=1" \
     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
     --net=host \
     --privileged \
     --volume=/dev:/dev \
     --volume=/dev/bus/usb:/dev/bus/usb \
     noetic \
     bash
}

remove()
{
  xhost +local:root
  sudo docker run --rm -it \
     --name="noetic"\
     --env="DISPLAY" \
     --env="QT_X11_NO_MITSHM=1" \
     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
     --net=host \
     --privileged \
     --volume=/dev:/dev \
     --volume=/dev/bus/usb:/dev/bus/usb \
     noetic \
     bash
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