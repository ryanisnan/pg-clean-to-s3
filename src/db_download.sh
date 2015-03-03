#! /bin/sh

echo "Downloading a dump of the database..."
pg_dump -h $REMOTE_DB_HOST -p $REMOTE_DB_PORT -d $REMOTE_DB_NAME -U $REMOTE_DB_USER -W -Fc > ../latest.dump

if [ $? -ne 0 ]
    then
        exit
fi

sudo su postgres
echo "Creating a new database locally..."
psql -c "DROP DATABASE IF EXISTS local_prune;"
psql -c "CREATE DATABASE local_prune;"

echo "Restoring data locally..."
pg_restore --clean --no-acl --no-owner -j 2 -h localhost -U postgres -d local_prune ../latest.dump