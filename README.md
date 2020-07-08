# Abridge Collector IAM Role Creation

Each AWS source that you connect to Abridge needs to have an IAM role created
that Abridge can use for data collection.

The Abridge collector IAM role needs:

- A cross-account trust to Abridge's AWS account, with an external ID set to
your Abridge organization's ID as shown at
[https://abridge.io/#/organization/settings](https://abridge.io/#/organization/settings).

- The AWS-managed SecurityAudit policy assigned.


This repository contains various methods for the creation of such a role.

See [https://abridge.io](https://abridge.io) for more information.
