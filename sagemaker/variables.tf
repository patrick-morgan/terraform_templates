// AWS Region
variable "region" {
    default = "us-east-1"
}

// Local AWS CLI Credentials Profile
variable "creds_profile" {
    default = "{INSERT CREDS NAME}"
}

// Name of sagemaker notebook instance and IAM role
variable "name" {
    default = "{INSERT UNIQUE NAME}"
}

variable "environment" {
    default = ""
}

// Instance type of notebook instance (EX: ml.t2.medium)
variable "instance_type" {
    default = "{INSERT INSTANCE TYPE}"
}

// Security groups to attach to the notebook instance
variable "security_groups" {
    default = [""]
}

// IAM policies for sagemaker notebook instance
variable "iam_policies" {
    default = ["arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"]
    description = "Basic Amazon sagemaker policy that gives it access to list many resources (s3, ec2, sns...)"
}

// New IAM policy to be created and granted to notebook instance
data "aws_iam_policy_document" "full-policy" {
    statement {
        sid = "SagePolicy"
        effect = "Allow"
        actions = ["s3:ListBucket", "s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
        resources = [""]
    }
}