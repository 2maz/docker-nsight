#!/usr/bin/bash
SCRIPT_DIR=$(realpath -L $(dirname $0))

export UID=$(id -u)
export GID=$(id -g)

if ! [ -x "$(command -v module)" ]; then
    module load docker
fi

if [ ! -x "$(command -v docker)" ]; then
    echo "Command 'docker' could not be found."
    exit 10
fi

DOCKER_IMAGE_NAME=2maz/nsight:12.6 
if docker image inspect $DOCKER_IMAGE_NAME >/dev/null 2>&1; then
    echo "Docker image: $DOCKER_IMAGE_NAME exists"
else
    pushd $SCRIPT_DIR
    docker build -t 2maz/nsight:12.6 -f Dockerfile.nsight .
    popd
fi

docker run \
    --user $UID:$GID \
    -w "/home/$USER" \
    --env HOME=/home/$USER \
    --env USER=$USER \
    --env DISPLAY=$DISPLAY \
    -it --rm \
    --net=host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$HOME:/home/$USER" \
    2maz/nsight:12.6
