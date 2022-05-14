docker login


sudo docker run -it --name my-redis-cli --link my-redis-container:redis --rm redis redis-cli -h redis -p 6379



docker rm $(docker ps --filter status=created -q)    

/ Build an image with souce image tag and version.
docker build  -t firstimage:version .

// Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
docker tag firstimage:version YOUR_DOCKERHUB_NAME/firstimage:version

// Push your TARGET_IMAGE to your docker hub repository
docker push YOUR_DOCKERHUB_NAME/firstimage:version


[form this site](https://www.codegrepper.com/code-examples/whatever/an+image+does+not+exist+locally+with+the+tag%3A)



docker network create myNetwork
docker network connect myNetwork web1
docker network connect myNetwork web2