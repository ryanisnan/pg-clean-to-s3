DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

chmod +x $DIR/src/*.sh

$DIR/src/db_download.sh

$DIR/src/db_prune.sh
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