#! /bin/sh


# first run page101.sh


docker container run -d -P --name ch6_wordpress \
    --memory 512m \
    --cpus 0.75 \
    --cap-drop net_raw \
    --link ch6_mariadb:mysql \
    -e WORDPRESS_DB_PASSWORD=test \
    wordpress:5.0.0-php7.2-apache

PORT=$(docker port ch6_wordpress 80/tcp | grep 0.0.0.0)
firefox "$PORT"