# ---------------------------------------------------------------------------------------------------------------------
# DEFINE OUTPUTS FOR THE RDS
# ---------------------------------------------------------------------------------------------------------------------

output "aws_instance_rds_id" {
    value = "${module.rds.rds_id}"
}