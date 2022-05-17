#! /bin/sh


docker run --rm \
    -p 8080 \
    alpine:3.8 echo "forward ephemeral TCP -> container TCP 8080"

docker run --rm \
    -p 8088:8080/udp \
    alpine:3.8 echo "host UDP 8088 -> container UDP 8080"

docker run --rm \
    -p 127.0.0.1:8080:8080/tcp \
    -p 127.0.0.1:3000:3000/tcp \
    alpine:3.8 echo "forward multiple TCP ports from localhost"

