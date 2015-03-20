#! /bin/sh

echo "Cleaning up..."
rm ../latest.dump
psql -U $LOCAL_DB_USER -c "DROP DATABASE IF EXISTS $LOCAL_DB_NAME;"