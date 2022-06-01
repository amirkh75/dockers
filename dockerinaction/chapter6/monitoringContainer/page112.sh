#! /bin/sh


docker container run --rm -it \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -u root monitoringtool