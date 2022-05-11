#! /bin/bash


docker volume create \
    --driver local \
    logging-example


docker run --name plath -d \
    --mount type=volume,src=logging-example,dst=/data \
    dockerinaction/ch4_writer_a


docker run --rm \
    --mount type=volume,src=logging-example,dst=/data \
    alpine:latest \
    head /data/logA


cd $(docker volume inspect --format "{{json .Mountpoint}}" logging-example)
dir="$( cd "$( dirname "${dir_}" )" && pwd )"
# dir=$(readlink "$dir")
echo $dir
# file="/_data/logA"




# cat "(${dir}${file})"
# echo "--------------------------------------"

docker stop plath

