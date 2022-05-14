#! /bin/sh


docker volume create \
    --driver local \
    --label example=location \
    location-example


docker volume inspect \
    --format "{{json .Mountpoint}}" \
    location-example

