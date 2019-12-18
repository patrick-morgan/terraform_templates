 data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-${aws_eks_cluster.eks.version}-v*"]
  }

  most_recent = true
}


data "aws_region" "current" {}

locals {
  eks-node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.eks.endpoint}' --b64-cluster-ca '${aws_eks_cluster.eks.certificate_authority.0.data}' '${var.cluster-name}'
USERDATA
}

resource "aws_launch_configuration" "eks" {
  associate_public_ip_address = false
  iam_instance_profile        = "${aws_iam_instance_profile.eks-node.name}"
  image_id                    = "${data.aws_ami.eks-worker.id}"
  instance_type               = "${var.instance_type}"
  name_prefix                 = "${var.cluster-name}"
  security_groups             = ["${aws_security_group.eks-node.id}"]
  user_data_base64            = "${base64encode(local.eks-node-userdata)}"

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  subnet_ids_string = "${join(",", var.subnets_subset)}"
  subnet_ids_list = "${split(",", local.subnet_ids_string)}"
}

resource "aws_autoscaling_group" "eks" {
  desired_capacity     = "${var.desired_capacity}"
  launch_configuration = "${aws_launch_configuration.eks.id}"
  max_size             = "${var.max_size}"
  min_size             = "${var.min_size}"
  name                 = "${var.cluster-name}-asg"

  vpc_zone_identifier  = "${local.subnet_ids_list}"

  tag {
    key                 = "Name"
    value               = "${var.cluster-name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key = "environment"
    value = "${var.environment}"
    propagate_at_launch = true
  }
}