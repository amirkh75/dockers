#! /bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

LOG_SRC=$SCRIPT_DIR/web-log-example
mkdir ${LOG_SRC}

docker run --name plath -d \
    --mount type=bind,src=${LOG_SRC},dst=/data \
    dockerinaction/ch4_writer_a

docker run --rm \
    --mount type=bind,src=${LOG_SRC},dst=/data \
    alpine:latest \
    head /data/logA

echo "---------------------------------------------------------------------------------------------------------"
cat ${LOG_SRC}/logA

docker rm -f plath


