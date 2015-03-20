#Description#
This app creates a copy of a remote database, runs some kind of script (provided by you) that manipulates the database in some way (possibly removing sensitive user information?), and uploads a copy to S3.

To automate this, simply run this script on a cron, so that your team consistently has access to a fresh, safe copy of your production database.

#Requirements#
- AWS CLI tools
- A running local postgres server
- Access to `psql` as the user defined in the `$LOCAL_DB_USER` env variable

#Installation & Configuration#

##Get the app##
`git clone https://github.com/ryanisnan/pg-clean-to-s3.git`

##Implement a cleanup script, and make it referenced by $PRUNE_SCRIPT##
Do whatever you want here. Go nuts. Every project is different, and every database needs tweaking in its own specific ways.

##Configure your environment variables##

    AWS_ACCESS_KEY="my_access_key"
    AWS_SECRET_KEY="my_secret_key"
    AWS_S3_BUCKET_NAME="my_s3_export_bucket_name"
    
    REMOTE_DB_HOST="domain-to-my-db.amazonaws.com"
    REMOTE_DB_PORT=1234
    REMOTE_DB_NAME="my_database"
    REMOTE_DB_USER="my_database_user"
    REMOTE_DB_PASSWORD="my_db_password"
    
    LOCAL_DB_USER="postgres"
    LOCAL_DB_NAME="tmp_db"
    
    PRUNE_SCRIPT=path/to/script.sh

#Run it#

    chmod +x pg-clean-to-s3/run.sh
    ./pg-clean-to-s3/run.sh