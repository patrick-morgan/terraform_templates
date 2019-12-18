resource "aws_security_group" "eks-cluster" {
  name = "${var.cluster-name}"
  description = "Security group for the eks cluster"
  vpc_id = "${var.vpc_id}"
   
  ingress {
  }

  egress {
  }
  
  tags = {
    Name = "${var.cluster-name}-eks"
    environment = "${var.environment}"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "eks-node" {
  name        = "eks-node"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${var.vpc_id}"

  egress {
  }
}