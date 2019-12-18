resource "aws_launch_configuration" "ec2" {
    name_prefix = "${var.name}-ec2-lc"
    image_id = "${data.aws_ami.ubuntu.id}"
    iam_instance_profile = "${aws_iam_instance_profile.iam_profile.name}"
    instance_type = "${var.instance_type}"
    security_groups = ["${aws_security_group.ec2.id}"]
    ebs_optimized = false
    enable_monitoring = "${var.monitoring}"
    associate_public_ip_address = true

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "ec2" {
    name = "${var.environment}-ag"
    launch_configuration = "${aws_launch_configuration.ec2.name}"
    min_size = "${var.asg_min_size}"
    max_size = "${var.asg_max_size}"
    vpc_zone_identifier = "${data.aws_subnet_ids.subnets.ids}"
    availability_zones = "${data.aws_availability_zones.az.zone_ids}"

    tag {
        key = "Name"
        value = "${var.environment}-${var.name}"
        propagate_at_launch = true
    }
    tag {
        key = "environment"
        value = "${var.environment}"
        propagate_at_launch = true
    }

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
    autoscaling_group_name = "${aws_autoscaling_group.ec2.id}"
    alb_target_group_arn = "${aws_lb_target_group.http.arn}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  owners = ["amazon"]
}

data "aws_availability_zones" "az" {}

data "aws_elb_hosted_zone_id" "zone" {}