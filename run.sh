chmod +x ./src/*.sh

./src/db_download.sh
./src/db_restore.sh
./src/db_prune.sh
./src/db_dump.sh
./src/db_upload.sh
./src/cleanup.sh

echo "Done."