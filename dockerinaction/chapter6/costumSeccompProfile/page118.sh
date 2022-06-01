#! /bin/bash


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


docker container run --rm -it \
    --security-opt seccomp=$SCRIPT_DIR/default.json \
    ubuntu:16.04 sh



# https://github.com/amirkh75/moby/blob/master/profiles/seccomp/default.json

