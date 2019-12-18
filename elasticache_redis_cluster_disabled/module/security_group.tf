# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP FOR THE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_subnet_ids" "private" {
  vpc_id = "${var.vpc_id}"
  tags = {
    terraform = ""
  }
}

resource "aws_security_group" "redis" {
  name = "${var.replication_group_name}-redis-security-group"
  description = "Security group for the redis instances"
  vpc_id = "${var.vpc_id}"
   
  ingress {
  }

  egress {
  }
  
  tags = {
    Name = "${var.replication_group_name}"
    environment = "${var.environment}"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}