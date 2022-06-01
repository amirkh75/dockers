#! /bin/sh


mkdir logFiles


sudo chown 2000:2000 logFiles

docker container run --rm -v "$(pwd)"/logFiles:/logFiles \
    -u 2000:2000 ubuntu:16.04 \
    /bin/bash -c "echo this is important info > /logFiles/important.log"


docker container run --rm -v "$(pwd)"/logFiles:/logFiles \
    -u 2000:2000 ubuntu:16.04 \
    /bin/bash -c "echo more info >> /logFiles/important.log"


cat logFiles/important.log
sudo rm -r logFiles