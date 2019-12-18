
resource "aws_iam_role" "redis" {
    name = "${var.replication_group_name}-redis-role"
    assume_role_policy = "${data.aws_iam_policy_document.iam_policy_document.json}"

    tags = {
        Name = "${var.replication_group_name}-redis-role"
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
    name = "${var.replication_group_name}-redis-profile"
    role = "${aws_iam_role.redis.name}"

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_iam_role_policy_attachment" "iam_policy_attachment" {
    role = "${aws_iam_role.redis.name}"
    policy_arn = "${var.policy_attachment}"
}


