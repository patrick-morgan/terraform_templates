module "aws_elasticache_cluster_enabled" {
    source = "./module"

    replication_group_name = "${var.replication_group_name}"
    replication_group_description = "${var.replication_group_description}"
    node_type = "${var.node_type}"
    port = "${var.port}"
    parameter_group_name = "${var.parameter_group_name}"
    vpc_id = "${data.aws_vpc.vpc.id}"
    snapshot_retention_limit = "${var.snapshot_retention_limit}"
    notification_topic_arn = "${var.notification_topic_arn}"
    replicas_per_node_group = "${var.replicas_per_node_group}"
    num_node_groups = "${var.num_node_groups}"
}

data "aws_vpc" "vpc" {
    tags = {
        Name = ""
    }
}

terraform {
    backend "s3" {
        encrypt = true
        bucket = ""
        region = "us-east-1"

        // CHANGE THE STATE
        key = ""
    }
}

provider "aws" {
    region = "${var.aws_region}"
    profile = "${var.creds_profile}"
}
