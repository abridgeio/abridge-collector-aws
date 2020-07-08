variable "abridge_organization_id" {
  type = string
}

locals {
  abridge_role_name       = "abridge-collector"
  abridge_role_policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  abridge_account_arn     = "arn:aws:iam::363506520957:root"
}

resource "aws_iam_role" "abridge_collector" {
  name = local.abridge_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = "sts:AssumeRole",
        Principal = { "AWS" : local.abridge_account_arn }
        Condition = { "StringEquals" : { "sts:ExternalId" : var.abridge_organization_id } }
    }]
  })
}

resource "aws_iam_policy_attachment" "abridge_collector_attach" {
  name       = "abridge-collector-policy-attachment"
  roles      = ["${aws_iam_role.abridge_collector.name}"]
  policy_arn = local.abridge_role_policy_arn
}

output "abridge_collector_role_arn" {
  description = "Abridge collector IAM role ARN"
  value       = aws_iam_role.abridge_collector.arn
}
