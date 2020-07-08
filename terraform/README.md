# Abridge Collector IAM Role Terraform Module

This Terraform module creates an AWS IAM role with a cross-account trust
that Abridge uses to collect AWS configuration data.

It assigns the AWS-managed SecurityAudit policy to the role.

It needs to be provided with the ID associated with your Abridge organization.

You may choose to copy the resources defined into the module directly into
an existing Terraform configuration. Alternatively, you may import the module
directly from GitHub like follows:

    module "abridge_collector" {
      source = "git::git@github.com:abridgeio/abridge-collector-role-creation.git//terraform"
      abridge_organization_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    }

    output "abridge_collector_role_arn" {
      value = module.abridge_collector.abridge_collector_role_arn
    }