# Docker container for Nsight Profiler and Nsight Compute

This container provides access to a container based runnable for:

- https://developer.nvidia.com/nsight-systems/get-started
- https://developer.nvidia.com/nsight-compute

## Build container

You can build the docker container manually:

```
docker build -t 2maz/nsight:12.6 -f Dockerfile.nsight .
```

To run the container, you can use:

```
./run-nsight-docker.sh
```

or check the arguments for startup.

## Runnable

Start the respective applications from the container, i.e.,
nsys-ui or ncu-ui
