#! /bin/sh


echo "e=mc^2" > garbage

chmod 600 garbage

sudo chown root garbage 


docker container run --rm -v "$(pwd)"/garbage:/test/garbage \
    -u nobody \
    ubuntu:16.04 cat /test/garbage 

echo "---------------------------------------------"

docker container run --rm -v "$(pwd)"/garbage:/test/garbage \
    -u root \
    ubuntu:16.04 cat /test/garbage


sudo rm -f garbage