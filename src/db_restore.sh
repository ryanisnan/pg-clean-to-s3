#! /bin/sh

psql -c "DROP DATABASE IF EXISTS local_prune;"
psql -c "CREATE DATABASE local_prune;"
pg_restore --clean --no-acl --no-owner -j 2 -h localhost -U postgres -d local_prune ../latest.dump