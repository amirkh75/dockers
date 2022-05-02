#! /bin/sh

docker stop $(docker ps)

list=$(docker ps -aq)

if [ -n "$list" ]; then
    docker rm -f $list
fi

net_list=$(docker network ls -q)


if [ -n "$net_list" ]; then
    docker network rm $net_list
fi

docker rm $(docker ps -a -f status=exited -f status=created -q)

# docker volume prune