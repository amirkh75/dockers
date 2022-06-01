#! /bin/sh


#  Mount video0 -> webcam , only if device has /dev/video0 it's run.

docker container run -it --rm \
    --device /dev/video0:/dev/video0 \
    ubuntu:16.04 ls -al /dev