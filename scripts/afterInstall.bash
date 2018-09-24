#!/bin/bash
#Script to pull bucketname from Parameter store, download configurations into 
config=$(aws ssm get-parameters --region us-east-2 --names CONFIG_BUCKET --query Parameters[0].Value)
config=`echo $config | sed -e 's/^"//' -e 's/"$//'`
aws s3 cp s3://$config/stage/ /var/www/html/ --recursive

#run setup scripts
#flush cache
