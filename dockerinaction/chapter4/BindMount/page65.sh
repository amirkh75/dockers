#! /bin/sh
/home/amirkh/Documents/dockers/containerCleaner.sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

touch $SCRIPT_DIR/example.log

cat >$SCRIPT_DIR/example.conf <<EOF
server {
 listen 80;
 server_name localhost;
 access_log /var/log/nginx/custom.host.access.log main;
 location / {
 root /usr/share/nginx/html;
 index index.html index.htm;
 }
}
EOF

CONF_DST=/etc/nginx/conf.d/default.conf;
CONF_SRC=$SCRIPT_DIR/example.conf

LOG_SRC=$SCRIPT_DIR/example.log
LOG_DST=/var/log/nginx/custom.host.access.log;
docker run -d --name diaweb \
 --mount type=bind,src=${CONF_SRC},dst=${CONF_DST},readonly=true \
 --mount type=bind,src=${LOG_SRC},dst=${LOG_DST} \
 -p 80:80 \
 nginx:latest

brave localhost &
sleep 2s
echo "-----------------------------------------------"
echo "docker logs diaweb: "
docker logs diaweb
echo "-----------------------------------------------"
echo "cat example.log: "
cat $SCRIPT_DIR/example.log

echo "-----------------------------------------------"
echo "try to change on example config wich is readonly"
docker exec diaweb sed -i "s/listen 80/listen 8080/" /etc/nginx/conf.d/default.conf 







