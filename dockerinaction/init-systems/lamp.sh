#! /bin/bash


docker run -d -p 80:80 --name lamp-test tutum/lamp
echo -e "\e[1;35m"
docker top lamp-test   
echo -e "\e[1;m"


docker exec lamp-test ps

docker exec lamp-test kill 435 

docker exec lamp-test kill 435 
