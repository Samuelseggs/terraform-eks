#!/usr/bin/env bash

# Write RDS demo parameters to Parameter Store

# Put parameters into Parameter Store
aws ssm put-parameter \
  --name /rds_demo/db_name \
  --type String \
  --value "jumia_phone_validator" \
  --description "Demo database name" \
  --overwrite

aws ssm put-parameter \
  --name /rds_demo/master_username \
  --type String \
  --value "jumia" \
  --description "Master Username for database" \
  --overwrite

aws ssm put-parameter \
  --name /rds_demo/master_password \
  --type SecureString \
  --value "dVgy7KfJfjHzACe" \
  --description "Master Password for database" \
  --overwrite

aws ssm put-parameter \
  --name /rds_demo/alert_phone \
  --type String \
  --value "+2347036200729" \
  --description "RDS alert SMS phone number" \
  --overwrite

# Get parameters from Parameter Store
aws ssm get-parameter \
  --name /rds_demo/db_name \
  #--query Parameter.Value

aws ssm get-parameter \
  --name /rds_demo/master_username \
  #--query Parameter.Value

aws ssm get-parameter \
  --with-decryption \
  --name /rds_demo/master_password \
  #--query Parameter.Value

aws ssm get-parameter \
  --name /rds_demo/alert_phone \
  #--query Parameter.Name
