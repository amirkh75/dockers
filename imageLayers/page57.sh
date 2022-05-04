#! /bin/sh


docker pull dockerinaction/ch3_myapp

echo "------------------------------------------"

docker pull dockerinaction/ch3_myotherapp



# clean up workspace
docker rmi dockerinaction/ch3_myapp dockerinaction/ch3_myotherapp