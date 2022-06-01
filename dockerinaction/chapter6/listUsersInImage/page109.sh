#! /bin/sh


list=$(docker container run --rm busybox:1.29 awk -F: '$0=$1' /etc/passwd)


echo number of existing users: $(echo $list | wc -w)
echo $list
