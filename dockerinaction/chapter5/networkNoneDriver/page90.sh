#! /bin/sh


docker run --rm \
    --network none \
    alpine:3.8 ip -o addr

echo "------------------------------------------"

docker run --rm \
    --network none \
    alpine:3.8 \
    ping -w 2 1.1.1.1

