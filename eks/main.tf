module "eks" {
  source = "./module"

  cluster-name = "${var.cluster-name}"
  environment = "${var.environment}"
  subnets_subset = "${data.aws_subnet_ids.private.ids}"
  vpc_id = "${data.aws_vpc.vpc.id}"
  desired_capacity = "${var.desired_capacity}"
  max_size = "${var.max_size}"
  min_size = "${var.min_size}"
  instance_type = "${var.instance_type}"
}

data "aws_vpc" "vpc" {
    tags = {
        Name = "${var.environment}"
    }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.vpc.id}"

    tags = {
      terraform = ""
    }
}

provider "aws" {
    region = "${var.aws_region}"
    profile = "${var.creds_profile}"
}

terraform {
    backend "s3" {
        encrypt = true

        bucket = "{INSERT BUCKET NAME}"
        region = "us-east-1"

        // CHANGE THE STATE TO A UNIQUE NAME
        key = ""
    }
}