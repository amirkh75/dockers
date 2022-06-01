#! /bin/sh


docker container run --rm \
    -u nobody:nogroup \
    busybox:1.29 id

echo "------------------------------"

docker container run --rm \
    -u 10000:20000 \
    busybox:1.29 whoami


echo "------------------------------"

docker container run --rm \
    -u 65534:65534 \
    busybox:1.29 id