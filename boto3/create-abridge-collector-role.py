#!/usr/bin/env python3

import boto3
import botocore.exceptions
import json

# get your Abridge org ID from https://abridge.io/#/organization/settings
ABRIDGE_ORGANIZATION_ID = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'

# these should not be modified, most likely
ABRIDGE_ROLE_NAME = 'abridge-collector'
ABRIDGE_ROLE_POLICY_ARN = 'arn:aws:iam::aws:policy/SecurityAudit'
ABRIDGE_ACCOUNT_ARN = 'arn:aws:iam::363506520957:root'

ABRIDGE_ROLE_POLICY = {
    'Version': '2012-10-17',
    'Statement': [
        {
            'Effect': 'Allow',
            'Principal': {
                'AWS': ABRIDGE_ACCOUNT_ARN
            },
            'Action': 'sts:AssumeRole',
            'Condition': {
                'StringEquals': {
                    'sts:ExternalId': ABRIDGE_ORGANIZATION_ID
                }
            }
        }
    ]
}

iam_client = boto3.client('iam')
try:
    # create the new collector role
    iam_client.create_role(
        RoleName=ABRIDGE_ROLE_NAME,
        AssumeRolePolicyDocument=json.dumps(ABRIDGE_ROLE_POLICY)
    )
    # attached the required policy to the new ARN
    iam_client.attach_role_policy(
        RoleName=ABRIDGE_ROLE_NAME,
        PolicyArn=ABRIDGE_ROLE_POLICY_ARN
    )
    # get the new role to check it was created
    iam_client.get_role(RoleName=ABRIDGE_ROLE_NAME)
except botocore.exceptions.ClientError as e:
    print('ERROR: {}'.format(e.response['Error']['Message']))
else:
    print('Abridge collector IAM role created.')
