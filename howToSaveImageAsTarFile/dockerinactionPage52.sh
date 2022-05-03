#! /bin/sh

alias doseExist='source /home/amirkh/Documents/dockers/howToSaveImageAsTarFile/ifExist.sh'


doseExist
docker pull busybox:latest

docker save -o myfile.tar busybox:latest
doseExist

docker rmi busybox
doseExist

docker load -i myfile.tar
doseExist