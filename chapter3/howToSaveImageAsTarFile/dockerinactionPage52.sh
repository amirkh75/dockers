#! /bin/sh


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
alias doseExist='source $SCRIPT_DIR/ifExist.sh'
echo 'source $SCRIPT_DIR/ifExist.sh'

doseExist
docker pull busybox:latest

docker save -o myfile.tar busybox:latest
doseExist

docker rmi busybox
doseExist

docker load -i myfile.tar
doseExist