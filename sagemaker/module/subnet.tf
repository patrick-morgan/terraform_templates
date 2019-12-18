# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP FOR THE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

locals {
  subnet_ids_string = "${join(",", data.aws_subnet_ids.subnets.ids)}"
  subnet_ids_list = "${split(",", local.subnet_ids_string)}"
}

data "aws_subnet_ids" "subnets" {
    vpc_id = "${var.vpc_id}"
}