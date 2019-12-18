// Fetches an existing IAM policy
data "aws_iam_policy" "existing" {
    arn = "${var.policy_attachment_arn}"
}

// Creates a new policy
data "aws_iam_policy_document" "group_policy" {
    statement {
        sid = "ec2Read"
        effect = "Allow"
        actions = [
            "ec2:Describe*"
        ]
        resources = [
            "*"
        ]
    }
}