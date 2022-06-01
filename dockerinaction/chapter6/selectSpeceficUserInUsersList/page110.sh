#! /bin/sh

source ./dockerinaction/chapter6/listUsersInImage/page109.sh

echo "--------------------------------------"
echo "with select user nobody."

docker container run --rm \
    --user nobody \
    busybox:1.29 id