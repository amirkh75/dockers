#! /bin/sh


docker run --name chomsky --volume /library/ss \
    alpine:latest echo "Chomsky collection created."
docker run --name lamport --volume /library/ss \
    alpine:latest echo "Lamport collection created."

docker run --name student \
    --volumes-from chomsky --volumes-from lamport \
    alpine:latest ls -l /library/

docker inspect -f "{{json .Mounts}}" student