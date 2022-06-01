#! /bin/sh



list=$(docker images ls -aq) 

if [ -n "$list" ]; then
    docker rmi $list
fi 