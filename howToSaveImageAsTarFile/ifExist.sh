#! /bin/sh

my_var=$(docker images | grep busybox)

echo "is there busybox?"


if [[ -n "$my_var" ]]
then
   echo -e "\e[1;32mTrue\e[1;m"
else
   echo -e "\e[1;31mFalse\e[1;m"
fi

echo "-------------------------------------------"
