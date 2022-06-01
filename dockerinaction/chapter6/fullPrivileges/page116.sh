#! /bin/bash


echo -e "\e[1;32m\n------------------------------------------\n\e[1;m"

docker container run --rm \
    --privileged \
    --userns host \
    ubuntu:16.04 id

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

docker container run --rm \
    --privileged \
    --userns host \
    ubuntu:16.04 capsh --print

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

docker container run --rm \
    --privileged \
    --userns host \
    ubuntu:16.04 ls /dev

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

docker container run --rm \
    --privileged \
    --userns host \
    ubuntu:16.04 networkctl

echo -e "\e[1;32m\n------------------------------------------\n\e[1;m"


docker container run --rm \
    --privileged \
    --userns host \
    ubuntu:16.04 networkctl

echo -e "\e[1;32m\n------------------------------------------\n\e[1;m"


docker container run --rm \
    --privileged \
    --userns host \
    --net host \
    ubuntu:16.04 networkctl

echo -e "\e[1;32m\n------------------------------------------\n\e[1;m"


