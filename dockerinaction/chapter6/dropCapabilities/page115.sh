#! /bin/sh


# capsh(capability shell wrapper) This tool provides a handy wrapper for certain types of capability testing and environment creation. It
#        also provides some debugging features useful for summarizing capability state.


echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

docker container run --rm -u nobody \
    ubuntu:16.04 \
    /bin/bash -c "capsh --print | grep net_raw"

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"


docker container run --rm -u nobody \
    --cap-drop net_raw \
    ubuntu:16.04 \
    /bin/bash -c "capsh --print | grep new_raw"

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"
