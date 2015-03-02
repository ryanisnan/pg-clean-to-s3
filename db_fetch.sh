#! /bin/sh

echo "Downloading a dump of the database"
pg_dump -h $REMOTE_DB_HOST -p $REMOTE_DB_PORT -d $REMOTE_DB_NAME -U $REMOTE_DB_USER -W -Fc > ../latest.dump