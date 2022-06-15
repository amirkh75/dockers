#! /bin/sh

rm /tmp/busy.cid


echo $(docker create --cidfile /tmp/busy.cid busybox:1.29) > /tmp/busy.cid

cat /tmp/busy.cid            


docker ps --latest --quiet

docker ps --latest --quiet --no-trunc