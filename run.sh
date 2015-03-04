chmod +x ./src/*.sh

./src/db_download.sh

./src/db_prune.sh
if [ $? -ne 0 ]
    then
        exit
fi

./src/db_upload.sh
if [ $? -ne 0 ]
    then
        exit
fi

./src/cleanup.sh