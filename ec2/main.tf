module "dev_ec2" {
    source = "./module"

    environment = "${var.environment}"
    name = "${var.instance_name}"
    aws_region = "${var.aws_region}"
    creds_profile = "${var.creds_profile}"
    instance_type = "${var.instance_type}"
    vpc_id = "${data.aws_vpc.vpc.id}"
    asg_min_size = "${var.asg_min_size}"
    asg_max_size = "${var.asg_max_size}"
    http_port = "${var.http_port}"
    https_port = "${var.https_port}"
    hosted_zone_name = "${var.hosted_zone_name}"
    policy_attachment = "${var.policy_attachment}"
}

data "aws_vpc" "vpc" {
    tags = {
        Name = "${var.environment}-vpc"
    }
}

terraform {
    backend "s3" {
        encrypt = true

        bucket = "{INSERT BUCKET NAME}"
        region = "us-east-1"

        // CHANGE THE STATE TO A UNIQUE NAME (EX: "ec2-dev-test")
        key = ""
    }
}

provider "aws" {
    region = "${var.aws_region}"
    profile = "${var.creds_profile}"
}