#! /bin/sh

cd ./buildAnImage

git clone https://github.com/dockerinaction/ch3_dockerfile.git

docker build -t dia_ch3/dockerfile:latest ch3_dockerfile
#                 image name                image file located name

my_var=$(docker images | grep dia_ch3/dockerfile)

echo -e "\e[1;35mis there dia_ch3/dockerfile image\e[1;33m?\e[1;m"


if [[ -n "$my_var" ]]
then
   echo -e "\e[1;32mTrue\e[1;m"
else
   echo -e "\e[1;31mFalse\e[1;m"
fi

echo "-------------------------------------------"

echo -e "\e[1;31mclean up workspace\e[1;m"

docker rmi dia_ch3/dockerfile
rm -rf ch3_dockerfile