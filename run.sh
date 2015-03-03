chmod +x ./src/*.sh

./src/db_download.sh
if [ $? -eq 0 ]
    then
        exit
fi

./src/db_restore.sh
if [ $? -eq 0 ]
    then
        exit
fi

./src/db_prune.sh
if [ $? -eq 0 ]
    then
        exit
fi

./src/db_dump.sh
if [ $? -eq 0 ]
    then
        exit
fi

./src/db_upload.sh
if [ $? -eq 0 ]
    then
        exit
fi

./src/cleanup.sh

echo "Done."