#! /bin/sh


docker run --rm \
    --dns 8.8.8.8 \
    alpine:3.8 \
    nslookup docker.com