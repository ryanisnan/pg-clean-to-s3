#! /bin/sh

echo "Uploading file to S3"
aws s3 mv ../latest.db s3://$AWS_S3_BUCKET_NAME/latest.dump