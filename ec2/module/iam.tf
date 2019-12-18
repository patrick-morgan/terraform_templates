
resource "aws_iam_role" "ec2" {
    name = "${var.name}-ec2-role"
    assume_role_policy = "${data.aws_iam_policy_document.iam_policy_document.json}"

    tags = {
        Name = "${var.name}-ec2-role"
        environment = "${var.environment}"
    }
}

data "aws_iam_policy_document" "iam_policy_document" {
    statement {
        effect = "Allow"
        actions = ["sts:AssumeRole"]
        
        principals {
        type = "Service"
        identifiers = "${var.assume_services}" 
        }
    }
}

resource "aws_iam_instance_profile" "iam_profile" {
    name = "${var.name}-ec2-profile"
    role = "${aws_iam_role.ec2.name}"

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_iam_role_policy_attachment" "iam_policy_attachment" {
    role = "${aws_iam_role.ec2.name}"
    policy_arn = "${var.policy_attachment}"
}


