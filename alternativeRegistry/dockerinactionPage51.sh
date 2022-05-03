#! /bin/sh

docker pull quay.io/dockerinaction/ch3_hello_registry:latest

# [REGISTRYHOST:PORT/] [USERNAME/] NAME [:TAG]


# remove an image

docker rmi quay.io/dockerinaction/ch3_hello_registry