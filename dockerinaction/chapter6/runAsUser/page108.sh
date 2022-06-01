#! /bin/sh


docker image pull busybox:1.29

echo "-----------------------------------------------"

docker image inspect busybox:1.29

# "DockerVersion": "18.06.1-ce",
#         "Author": "",
#         "Config": {
#             "Hostname": "",
#             "Domainname": "",
#             "User": "",               $$$$$$$$$$$$$$$$$$$$$$$$$  if the result is blank, the container will dafault to running as the root user.
#             "AttachStdin": false,
#             "AttachStdout": false,
#             "AttachStderr": false,
#             "Tty": false,
#             "OpenStdin": false,
#             "StdinOnce": false,
#             "Env": [
#                 "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#             ],

echo "-----------------------------------------------"

docker inspect --format "{{.Config.User}}" busybox:1.29 # if the result is blank, the container will dafault to running as the root user.


echo "-----------------------------------------------"

# if user change in entrypiont.

docker container run --rm --entrypoint "" busybox:1.29 whoami   #  --entrypoint ""  it override entrypoint with "" 

docker container run --rm --entrypoint "" busybox:1.29 id

