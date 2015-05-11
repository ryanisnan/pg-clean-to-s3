#! /bin/sh
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Downloading a dump of the database..."
PGPASSWORD=$REMOTE_DB_PASSWORD pg_dump -h $REMOTE_DB_HOST -p $REMOTE_DB_PORT -U $REMOTE_DB_USER -Fc $REMOTE_DB_NAME > $DIR/../latest.dump

if [ $? -ne 0 ]
    then
        exit
fi

echo "Creating a new database locally..."
psql -U $LOCAL_DB_USER -c "DROP DATABASE IF EXISTS $LOCAL_DB_NAME;"
psql -U $LOCAL_DB_USER -c "CREATE DATABASE $LOCAL_DB_NAME;"

echo "Restoring data locally..."
pg_restore --no-acl --no-owner -h localhost -U $LOCAL_DB_USER -d $LOCAL_DB_NAME $DIR/../latest.dump