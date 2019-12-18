module "aws_group" {
    source = "./module"
    policy_attachment_existing = "${data.aws_iam_policy.existing.arn}"
    group_policy_json = "${data.aws_iam_policy_document.group_policy.json}"
    group_name = "${var.group_name}"
}

terraform {
    backend "s3" {
        encrypt = true

        bucket = "{INSERT BUCKET NAME}"
        region = "us-east-1"

        ### CHANGE THE STATE
        key = ""
    }
}

provider "aws" {
    region = "${var.aws_region}"
    profile = "${var.creds_profile}"
}