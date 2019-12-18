resource "aws_db_subnet_group" "subnet-group"{
  name = "${var.db_subnet_group_name}"
  subnet_ids = "${var.subnet_ids}"
  description = "${var.name} subnet group for rds instances"
}