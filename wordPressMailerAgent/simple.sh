#! /bin/sh

echo "-------------------------------------------------------"
echo "mysql"

DB_CID=$(docker create -e MYSQL_ROOT_PASSWORD=ch2demo mysql:5.7)
docker start $DB_CID

echo "-------------------------------------------------------"
echo "mailer"

MAILER_CID=$(docker create dockerinaction/ch2_mailer)
docker start $MAILER_CID



echo "-------------------------------------------------------"
echo "wordpress"

WP_CID=$(docker create --link $DB_CID:mysql -p 80 \
        --name wp_$CLIENT_ID \
        --read-only -v /run/apache2/ --tmpfs /tmp \
        -e WORDPRESS_DB_NAME=$CLIENT_ID \
        --read-only wordpress:5.0.0-php7.2-apache)
docker start $WP_CID

ModeWP=$(docker inspect --format "{{.State.Running}}" $WP_CID)

if [ $ModeWP = true  ]
then
   echo -e "\e[1;32mTrue\e[1;m"
else
   echo -e "\e[1;31mFalse\e[1;m"
fi


echo "-------------------------------------------------------"
echo "agent"

AGENT_CID=$(docker create --name agent_$CLIENT_ID \
            --link $WP_CID:insideweb \
            --link $MAILER_CID:insidemailer dockerinaction/ch2_agent)
docker start $AGENT_CID

ModeAG=$(docker inspect --format "{{.State.Running}}" $AGENT_CID)

if [ $ModeAG = true  ]
then
   echo -e "\e[1;32mTrue\e[1;m"
else
   echo -e "\e[1;31mFalse\e[1;m"
fi

echo "-------------------------------------------------------"
echo "agent logs"
docker logs  $AGENT_CID