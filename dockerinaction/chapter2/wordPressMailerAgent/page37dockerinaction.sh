#! /bin/sh


source "/home/amirkh/Documents/Docker/dockers/dockerinaction/utils/containerCleaner.sh" &> containerCleanerLogs.txt

echo "-------------------------------------------------------"
echo "mysql"

DB_CID=$(docker create -e MYSQL_ROOT_PASSWORD=ch2demo mysql:5.7)

docker start $DB_CID

sleep 2s

source "/home/amirkh/Documents/Docker/dockers/dockerinaction/utils/checkContanerState.sh" $DB_CID

echo "-------------------------------------------------------"
echo "mailer"
MAILER_CID=$(docker create dockerinaction/ch2_mailer)
docker start $MAILER_CID

sleep 2s

source "/home/amirkh/Documents/Docker/dockers/dockerinaction/utils/checkContanerState.sh" $MAILER_CID

echo "-------------------------------------------------------"
echo "wordpress"

WP_CID=$(docker create --link $DB_CID:mysql -p 8000:80 \
        --read-only -v /run/apache2/ --tmpfs /tmp \
        wordpress:5.0.0-php7.2-apache)

docker start $WP_CID

sleep 2s

source "/home/amirkh/Documents/Docker/dockers/dockerinaction/utils/checkContanerState.sh" $WP_CID

echo "-------------------------------------------------------"
echo "agent"

AGENT_CID=$(docker create --link $WP_CID:insideweb \
            --link $MAILER_CID:insidemailer amirkh75/agent:v8)

docker start $AGENT_CID

sleep 2s

source "/home/amirkh/Documents/Docker/dockers/dockerinaction/utils/checkContanerState.sh" $AGENT_CID

echo "-------------------------------------------------------"

echo "agent logs"
docker logs  $AGENT_CID