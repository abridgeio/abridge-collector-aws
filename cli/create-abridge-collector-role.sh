#!/bin/sh

# get your Abridge org ID from https://abridge.io/#/organization/settings
ABRIDGE_ORGANIZATION_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

# these should not be modified, most likely
ABRIDGE_ROLE_NAME=abridge-collector
ABRIDGE_ROLE_POLICY_ARN=arn:aws:iam::aws:policy/SecurityAudit
ABRIDGE_ACCOUNT_ARN=arn:aws:iam::363506520957:root

ABRIDGE_ROLE_POLICY={\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"$ABRIDGE_ACCOUNT_ARN\"},\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"$ABRIDGE_ORGANIZATION_ID\"}}}]}

echo $ABRIDGE_ROLE_POLICY | aws iam create-role --role-name $ABRIDGE_ROLE_NAME --assume-role-policy-document file:///dev/stdin

aws iam attach-role-policy --role-name $ABRIDGE_ROLE_NAME --policy-arn $ABRIDGE_ROLE_POLICY_ARN

aws iam get-role --role-name $ABRIDGE_ROLE_NAME --query Role.Arn
