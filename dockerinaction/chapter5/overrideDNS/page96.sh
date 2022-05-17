#! /bin/sh


docker run --rm \
    --add-host test:10.10.10.255 \
    alpine:3.8 \
    nslookup test
    # cat /etc/hosts


