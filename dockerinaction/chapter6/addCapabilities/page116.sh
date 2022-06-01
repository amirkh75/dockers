#! /bin/bash


echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

docker container run --rm -u nobody \
    ubuntu:16.04 \
    /bin/bash -c "capsh --print | grep sys_admin"

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

docker container run --rm -u nobody \
    --cap-add sys_admin \
    ubuntu:16.04 \
    /bin/bash -c "capsh --print | grep sys_admin"

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"
