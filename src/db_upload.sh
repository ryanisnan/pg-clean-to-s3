#! /bin/sh

echo "Preparing local database as latest_new.dump"
pg_dump -U $LOCAL_DB_USER -Fc $LOCAL_DB_NAME > ../latest_new.dump

if [ $? -ne 0 ]
    then
        exit
fi

echo "Uploading file to S3..."
aws s3 mv ../latest.dump s3://$AWS_S3_BUCKET_NAME/latest.dump