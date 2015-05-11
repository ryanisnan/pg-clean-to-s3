#! /bin/sh

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Cleaning up..."
rm $DIR/../latest.dump
psql -U $LOCAL_DB_USER -c "DROP DATABASE IF EXISTS $LOCAL_DB_NAME;"