# Abridge Collector IAM Role Creation

Abridge, <https://abridge.io>, visually summarizes your cloud environment
and infrastructure.

Each AWS source that you connect to Abridge needs to have an IAM role created
that Abridge can use for data collection.

Once you've created the role, you'll need to log in to Abridge and add a new
source at <https://abridge.io/#/organization/sources>.

The Abridge collector IAM role needs:

- A cross-account trust to Abridge's AWS account, with an external ID set to
your Abridge organization's ID as shown at
<https://abridge.io/#/organization/settings>.

- The AWS-managed SecurityAudit policy assigned.


This repository contains various methods for the creation of such a role.


