#! /bin/sh


for i in amazon google microsoft; \
do \
docker run --rm \
    --mount type=volume,src=$i,dst=/tmp \
    --entrypoint /bin/sh \
    alpine:latest -c "nslookup $i.com > /tmp/results.txt"; \
done

docker volume list

