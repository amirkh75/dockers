#! /bin/sh


docker run --rm \
    --dns-search docker.com \
    alpine:3.8 \
    nslookup hub


echo "-----------------------------------"


docker run --rm \
    --dns-search docker.com \
    --dns 1.1.1.1 \
    alpine:3.8 cat /etc/resolv.conf


