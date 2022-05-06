#! /bin/sh


docker run --rm \
    --mount type=tmpfs,dst=/tmp \
    --entrypoint mount \
    alpine:latest -v



# tmpfs on /tmp type tmpfs (rw,nosuid,nodev,noexec,relatime,inode64)