# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP FOR THE RDS DB INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "rds" {
  name = "${var.name}"
  description = "Security group for the RDS db instances"
  vpc_id = "${var.vpc_id}"
   
  ingress {
  }

  egress {
  }

  tags = {
    Name = "${var.name}"
    environment = "${var.environment}"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}
