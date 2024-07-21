#!/bin/bash

COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_END="\033[0m"

echo
echo
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo -e "$COLOR_GREEN ||   run rs-humble   || $COLOR_END"
echo -e "$COLOR_GREEN ----------------------- $COLOR_END"
echo
echo

default()
{
  sudo docker run -it \
     --name="rs-humble"\
     --env="DISPLAY" \
     --env="QT_X11_NO_MITSHM=1" \
     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
     --volume="/home/wj/Library/kalibr/data:/data" \
     --net=host \
     --privileged \
     --volume=/dev:/dev \
     --volume=/dev/bus/usb:/dev/bus/usb \
     rs-humble \
     bash
}

remove()
{
  sudo docker run --rm -it \
     --name="rs-humble"\
     --env="DISPLAY" \
     --env="QT_X11_NO_MITSHM=1" \
     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
     --volume="/home/wj/Library/kalibr/data:/data" \
     --net=host \
     --privileged \
     --volume=/dev:/dev \
     --volume=/dev/bus/usb:/dev/bus/usb \
     rs-humble \
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