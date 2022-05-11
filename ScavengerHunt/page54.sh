#! /bin/sh
cd ./ScavengerHunt
# git clone https://github.com/dockerinaction/ch3_ex2_hunt.git

git clone https://github.com/dockerinaction/ch3_ex2_huntanswer.git

docker build -t allingeek/ch3_ex2_huntanswer:latest ch3_ex2_huntanswer

docker run -it --rm allingeek/ch3_ex2_huntanswer

docker run -it --rm dockerinaction/ch3_ex2_hunt


# clean the workspace
docker rmi dockerinaction/ch3_ex2_hunt
docker rmi allingeek/ch3_ex2_huntanswer