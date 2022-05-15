#! /bin/sh


clear

docker network create \
    --driver bridge \
    --label project=dockerinaction \
    --label chapter=5 \
    --attachable \
    --scope local \
    --subnet 10.0.42.0/24 \
    --ip-range 10.0.42.128/25 \
    user-network


docker network ls | grep user-network

docker network rm user-network