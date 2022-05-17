#! /bin/sh


docker run -d -p 8080 --name listener alpine:3.8 sleep 300

docker port listener

echo "-------------------------------------------------"

docker run -d \
    -p 8080 \
    -p 3000 \
    -p 7500 \
    --name multi-listener \
    alpine:3.8 sleep 300


docker port multi-listener

