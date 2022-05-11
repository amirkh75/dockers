#! /bin/sh

docker stop $(docker ps) &> containerCleaner_log_file.txt

list=$(docker ps -aq) 

if [ -n "$list" ]; then
    docker rm -f $list &>> containerCleaner_log_file.txt
fi

net_list=$(docker network ls -q) &>> containerCleaner_log_file.txt


yes | docker network prune &>> containerCleaner_log_file.txt

# if [ -n "$net_list" ]; then
#     docker network rm $net_list
# fi

# docker rm $(docker ps -a -f status=exited -f status=created -q)

yes | docker volume prune

clear

