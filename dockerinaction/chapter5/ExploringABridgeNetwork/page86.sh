#! /bin/sh


source /home/amirkh/Documents/dockers/dockerinaction/utils/containerCleaner.sh

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


docker run -it \
    --network user-network \
    --name network-explorer \
    alpine:3.8 \
        sh

# input:
# ip -f inet -4 -o addr

# output
# 1: lo    inet 127.0.0.1/8 scope host lo\       valid_lft forever preferred_lft forever
# 40: eth0    inet 10.0.42.129/24 brd 10.0.42.255 scope global eth0\       valid_lft forever preferred_lft forever

# ctrl+p then ctrl+q

# second bridge

docker network create \
    --driver bridge \
    --label project=dockerinaction \
    --label chapter=5 \
    --attachable \
    --scope local \
    --subnet 10.0.43.0/24 \
    --ip-range 10.0.43.128/25 \
    user-network2


# attach the user-network to the network-explorer container

docker network connect \
    user-network2 \
    network-explorer

# reattach terminal to the network-explorer

docker attach network-explorer

# input:
# ip -f inet -4 -o addr

# output
# 1: lo    inet 127.0.0.1/8 scope host lo\       valid_lft forever preferred_lft forever
# 40: eth0    inet 10.0.42.129/24 brd 10.0.42.255 scope global eth0\       valid_lft forever preferred_lft forever
# 43: eth1    inet 10.0.43.129/24 brd 10.0.43.255 scope global eth1\       valid_lft forever preferred_lft forever


# input:
# apk update && apk add nmap
# nmap -sn 10.0.42.* -sn 10.0.43.* -oG /dev/stdout | grep Status

# output:
# Host: 10.0.42.128 ()	Status: Up
# Host: 10.0.42.129 (9fb42c028ee7)	Status: Up
# Host: 10.0.43.128 ()	Status: Up
# Host: 10.0.43.129 (9fb42c028ee7)	Status: Up