# ---------------------------------------------------------------------------------------------------------------------
# DEFINE SHARED DATA BLOCKS FOR SQS
# ---------------------------------------------------------------------------------------------------------------------

module "sagemaker" {
  source = "./module"

  vpc_id = "${data.aws_vpc.vpc.id}"
  name = "${var.name}"
  instance_type = "${var.instance_type}"
  security_groups = "${var.security_groups}"
  environment = "${var.environment}"
  iam_policies = "${var.iam_policies}"
  new_policy = "${data.aws_iam_policy_document.full-policy.json}"
}


// Looks up the vpc given the environment 
data "aws_vpc" "vpc" {
    tags = {
        Name = "${var.environment}"
    }
}

provider "aws" {
  region = "${var.region}"
  profile = "${var.creds_profile}"
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