variable "aws_region" {
    default = "us-east-1"
}

variable "creds_profile" {
    default = "{INSERT CREDS NAME}"
}

// Name of newly created group (MUST BE ALPHA-NUMERIC)
variable "group_name" {
    default = "{INSERT UNIQUE GROUP NAME}"
}

// Arn of existing policy to attach to group (ex: arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess)
variable "policy_attachment_arn" {
    default = "{INSERT ARN OF EXISTING POLICY TO ATTACH TO GROUP}"
}