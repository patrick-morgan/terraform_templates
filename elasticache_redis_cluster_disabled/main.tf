module "aws_elasticache_cluster_disabled" {
    source = "./module"

    aws_region = "${var.aws_region}"
    environment = "${var.environment}"
    vpc_id = "${data.aws_vpc.vpc.id}"
    replication_group_name = "${var.replication_group_name}"
    replication_group_description = "${var.replication_group_description}"
    node_type = "${var.node_type}"
    number_cache_clusters = "${var.number_cache_clusters}"
    parameter_group_name = "${var.parameter_group_name}"
    port = "${var.port}"
}

data "aws_vpc" "vpc" {
    tags = {
        Name = "${var.environment}"
    }
}

terraform {
    backend "s3" {
        encrypt = true

        bucket = "{INSERT BUCKET NAME}"
        region = "us-east-1"

        // CHANGE THE STATE
        key = "terraform-state/{INSERT UNIQUE STATE}/terraform.tfstate"
    }
}

provider "aws" {
    region = "${var.aws_region}"
    profile = "${var.creds_profile}"
}