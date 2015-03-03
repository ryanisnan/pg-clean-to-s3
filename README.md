#Description#

#Requirements#
- AWS CLI tools

#Installation & Configuration#

##Get the app##
`git clone https://github.com/ryanisnan/pg-clean-to-s3.git`

##Configure your environment variables##
    
    AWS_ACCESS_KEY="my_access_key"
    AWS_SECRET_KEY="my_secret_key"
    AWS_S3_BUCKET_NAME="my_s3_export_bucket_name"
    REMOTE_DB_HOST="domain-to-my-db.amazonaws.com"
    REMOTE_DB_PORT=1234
    REMOTE_DB_NAME="my_database"
    REMOTE_DB_USER="my_database_user"

##Implement db_prune.sh##
Using simple PSQL commands, implement whatever pruning instructions you require. Some examples are, changing all user passwords to "1234". This step is entirely project dependent, and is left up to you to implement.

#Run it#
`./fetch_copy.sh`