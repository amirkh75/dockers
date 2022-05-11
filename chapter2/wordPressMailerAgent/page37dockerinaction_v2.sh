#! /bin/sh


source "/home/amirkh/Documents/dockers/containerCleaner.sh" &> containerCleanerLogs.txt

CLIENT_ID="v2"

echo "-------------------------------------------------------"
echo "mysql"

DB_CID=$(docker create -e MYSQL_ROOT_PASSWORD=ch2demo mysql:5.7)

docker start $DB_CID

sleep 2s

source "/home/amirkh/Documents/dockers/checkContanerStatus.sh" $DB_CID

echo "-------------------------------------------------------"
echo "mailer"
MAILER_CID=$(docker create dockerinaction/ch2_mailer)
docker start $MAILER_CID

sleep 2s

source "/home/amirkh/Documents/dockers/checkContanerStatus.sh" $MAILER_CID

echo "-------------------------------------------------------"
echo "wordpress"

WP_CID=$(docker create --link $DB_CID:mysql -p 8000 \
        --name wp_$CLIENT_ID \
        --read-only -v /run/apache2/ --tmpfs /tmp \
        -e WORDPRESS_DB_NAME=$CLIENT_ID \
        --read-only wordpress:5.0.0-php7.2-apache)

docker start $WP_CID

sleep 2s

source "/home/amirkh/Documents/dockers/checkContanerStatus.sh" $WP_CID

echo "-------------------------------------------------------"
echo "agent"

AGENT_CID=$(docker create --name agent_$CLIENT_ID \
            --link $WP_CID:insideweb \
            --link $MAILER_CID:insidemailer \
            -e INSIDEWEB_PORT_80_TCP_PORT=8000 \
             dockerinaction/ch2_agent)

docker start $AGENT_CID

sleep 2s

source "/home/amirkh/Documents/dockers/checkContanerStatus.sh" $AGENT_CID

echo "-------------------------------------------------------"

echo "agent logs"
docker logs  $AGENT_CID