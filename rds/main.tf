module "rds" {
    source = "./module"
    
    // DB Initialization
    identifier = "${var.environment}-${var.name}"
    name = "${var.name}"
    username = "${var.username}"
    password = "${var.password}"

    // Engine details
    engine = "${var.engine}"
    instance_class = "${var.instance_class}"
    allocated_storage = "${var.allocated_storage}"
    environment = "${var.environment}"
    db_subnet_group_name = "${var.environment}-${var.name}"
    parameter_group_name = "${var.parameter_group_name}"
    hosted_zone = "${var.hosted_zone}"
    subnet_ids = "${data.aws_subnet_ids.private.ids}"
    vpc_id = "${data.aws_vpc.vpc.id}"
    route53_zone_id = "${data.aws_route53_zone.dev.id}"
}

terraform {
    backend "s3" {
        encrypt = true

        bucket = "{INSERT BUCKET NAME}"
        region = "us-east-1"

        // CHANGE THE STATE TO A UNIQUE NAME (EX: "rds-dev-test")
        key = ""
    }
}

provider "aws" {
    region = "${var.aws_region}"
    profile = "${var.creds_profile}"
}