resource "aws_iam_policy" "new_policy" {
    name = "${var.group_name}"
    policy = "${var.group_policy_json}"
}

// Attaches policy created above to the group
resource "aws_iam_group_policy_attachment" "attach" {
    group = "${aws_iam_group.group.id}" 
    policy_arn = "${aws_iam_policy.new_policy.arn}"
}

// Attaches fetched existing policy to the group
resource "aws_iam_group_policy_attachment" "existing" {
    group = "${aws_iam_group.group.id}" 
    policy_arn = "${var.policy_attachment_existing}"
}