#Description#
This project tries to make it easier to fetch developer-ready copies of your production database, with a hook in place for you to define what "developer-ready" means. Maybe you want to remove 99% of users from the system to make the copy of the database lighter? Maybe you want to remove all sensitive user data? Maybe both?

To automate this, simply run this script on a cron, so that your team consistently has access to a fresh, safe copy of your production database.

#Requirements#
- AWS CLI tools
- A running local postgres server
- Access to PSQL as the user defined in the $LOCAL_DB_USER env variable

#Installation & Configuration#

##Get the app##
`git clone https://github.com/ryanisnan/pg-clean-to-s3.git`

##Implement db_prune.sh##
Using simple PSQL commands, implement whatever pruning instructions you require. Some examples are, changing all user passwords to "1234". This step is entirely project dependent, and is left up to you to implement.

Note the script path, as you will use it in the next step.

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