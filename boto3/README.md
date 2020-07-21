# Abridge Collector IAM Role Boto3 Script

This Python script uses the AWS boto3 module to create as AWS IAM role with a
cross-account trust that Abridge uses to collect AWS configuration data.

It assigns the AWS-managed SecurityAudit policy to the role.

It needs to be edited with the ID associated with your Abridge organization.


After creating the role, you will need to add a new source to Abridge using
the ARN for that role.
