#! /bin/sh


docker container run -d \
    --cpuset-cpus 0,1 \
    --name ch6_stresser dockerinaction/ch6_stresser


docker container run -it --rm dockerinaction/ch6_htop



docker rm -vf ch6_stresser