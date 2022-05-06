#! /bin/sh


docker volume create --driver local --label example=cassandra cass-shared # cass-shared is the name of volume.


docker run -d \
    --volume cass-shared:/var/lib/cassandra/data \
    --name cass1 \
    cassandra:2.2 

sleep 2s

docker run -it --rm \
    --link cass1:cass \
    cassandra:2.2 cqlsh cass


# cqlsh> select *
#    ... from system.schema_keyspaces
#    ... where keyspace_name = 'docker_hello_world';

#  keyspace_name | durable_writes | strategy_class | strategy_options
# ---------------+----------------+----------------+------------------

# (0 rows)


# ---------------------------------------------------------------------------------------------------------------------------------

# cqlsh> create keyspace docker_hello_world with replication = { 'class' :'SimpleStrategy', 'replication_factor': 1 };
# cqlsh> select * from system.schema_keyspaces where keyspace_name = 'docker_hello_world';

#  keyspace_name      | durable_writes | cass-shared

# cqlsh> quit


# clean up
docker stop cass1
docker rm -vf cass1 cass-shared