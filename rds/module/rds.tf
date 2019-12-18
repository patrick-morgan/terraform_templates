resource "aws_db_instance" "rds" {

    // DB Initialization
    identifier = "${var.identifier}"
    name = "${var.name}"
    username = "${var.username}"
    password = "${var.password}"
    
    // Engine details
    engine = "${var.engine}"
    engine_version = "${var.engine_version}"
    instance_class = "${var.instance_class}"
    allocated_storage = "${var.allocated_storage}"
    
    vpc_security_group_ids = ["${aws_security_group.rds.id}"]
    maintenance_window = "${var.maintenance_window}"
    backup_window = "${var.backup_window}"
    backup_retention_period = "${var.backup_retention_period}"
    
    storage_encrypted = true

    allow_major_version_upgrade = "${var.allow_major_version_upgrade}"
    parameter_group_name = "${var.parameter_group_name}"
    db_subnet_group_name = "${var.db_subnet_group_name}"
    
    skip_final_snapshot = "${var.skip_final_snapshot}"
}

resource "aws_route53_record" "record" {
    zone_id = "${data.aws_route53_zone.zone.id}"
    type = "CNAME"
    name = "${var.name}"
    ttl = ""
    records = ["${aws_db_instance.rds.endpoint}"]
}

data "aws_route53_zone" "zone" {
    name = "${var.hosted_zone}"
}