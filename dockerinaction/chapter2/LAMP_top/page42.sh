#! /bin/sh


# LAMP =>> Linux , Apache , Mysql , Php.

docker run -p 80:80 --name lamp-test tutum/lamp


docker top lamp-test

