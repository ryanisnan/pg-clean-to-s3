#! /bin/sh

echo "Preparing local database as latest_new.dump"
pg_dump -Fc local_prune > ../latest_new.dump

echo "Uploading file to S3..."
aws s3 mv ../latest.dump s3://$AWS_S3_BUCKET_NAME/latest.dump