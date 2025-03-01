#!/bin/bash

COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_END="\033[0m"

echo
echo
echo -e "$COLOR_GREEN ------------------------ $COLOR_END"
echo -e "$COLOR_GREEN ||   exec humble-rs   || $COLOR_END"
echo -e "$COLOR_GREEN ------------------------ $COLOR_END"
echo
echo

sudo docker exec -it humble-rs bash -c "cd /ros2_ws && exec bash"