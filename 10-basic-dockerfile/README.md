https://roadmap.sh/projects/basic-dockerfile

# Description
This folder contains of my solution for "Dummy Systemd Service" project. Source code contains of the `Dockerfile`, which is used to build a Docker image; and `entrypoint.sh`, which is used as an entrypoint inside the container build off of this image.

Instruction contains of steps on build an image and run a container.

# Instruction

## Build an image
```bash
docker build --build-arg NAME=<your_name> -t hello-captain-image .
```

## Run container
```bash
docker run --rm hello-captain-image:latest
```
`--rm` is used to delete the container once finished - good practice
