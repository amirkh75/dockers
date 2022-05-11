#! /bin/bash


docker run -d --name backoff-detector --restart always busybox:1.29 date


sleep 10s


docker logs -f backoff-detector


docker stop backoff-detector &> /dev/null

docker rm backoff-detector &> /dev/null