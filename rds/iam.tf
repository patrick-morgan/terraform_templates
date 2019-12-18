resource "aws_iam_role" "rds" {
    name = "${var.name}"
    assume_role_policy = "${data.aws_iam_policy_document.rds.json}"

    tags = {
        Name = "${var.name}"
        environment = "${var.environment}"
    }
}

data "aws_iam_policy_document" "rds" {
    statement {
        effect = "Allow"
        actions = ["sts:AssumeRole"]
        
        principals {
        type = "Service"
        identifiers = ["ec2.amazonaws.com", "ssm.amazonaws.com"]
        }
    }
}

resource "aws_iam_instance_profile" "rds" {
    name = "${var.name}"
    role = "${aws_iam_role.rds.name}"

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_iam_role_policy_attachment" "enhanced_monitoring" {
    role = "${aws_iam_role.rds.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}


