#!/usr/bin/bash
export UID=$(id -u)
export GID=$(id -g)

module load docker

docker run \
    --user $UID:$GID \
    -w "/home/$USER" --env HOME=/home/$USER --env USER=$USER \
    -it --rm --net=host --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix -v "$HOME:/home/$USER" \
    roehr/nsight:12.6
