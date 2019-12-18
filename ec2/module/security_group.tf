# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP FOR THE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

locals {
  subnet_ids_string = "${join(",", data.aws_subnet_ids.subnets.ids)}"
  subnet_ids_list = "${split(",", local.subnet_ids_string)}"
}

data "aws_subnet_ids" "subnets" {
    vpc_id = "${var.vpc_id}"
}

resource "aws_security_group" "ec2" {
  name = "${var.name}"
  description = "Security group for the ec2 instances"
  vpc_id = "${var.vpc_id}"
   
  ingress {
  }

  egress {
  }
  
  tags = {
    Name = "${var.name}-ec2-sg"
    environment = "${var.environment}"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}