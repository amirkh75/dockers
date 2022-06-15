#! /bin/bash


docker run --name backoff-detector --restart always busybox:1.29 date


sleep 5

docker logs -f backoff-detector


docker stop backoff-detector &> /dev/null

docker rm backoff-detector &> /dev/null