#! /bin/sh


docker run --rm  -it \
    --network host \
    alpine:3.8 ip -o addr # sh >>> nc 192.168.48.8 >> another pc ip in home router