#! /bin/sh

echo "Creating a new database dump"
pg_dump -Fc local_prune > ../latest_new.dump