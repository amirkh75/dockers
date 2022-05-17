#! /bin/sh


docker run --rm \
    --hostname barker \
    alpine:3.8 \
    nslookup barker

