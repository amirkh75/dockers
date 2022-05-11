#! /bin/sh

Mode=$(docker inspect --format "{{.State.Running}}" $1)

if [ $Mode = true  ]
then
   echo -e "\e[1;32mTrue\e[1;m"
else
   echo -e "\e[1;31mFalse\e[1;m"
fi
