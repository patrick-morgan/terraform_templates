resource "aws_iam_role" "role" {
    name = "${var.name}"
    assume_role_policy = "${data.aws_iam_policy_document.iam_policy_document.json}"
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

resource "aws_iam_role_policy_attachment" "batch" {
    role = "${aws_iam_role.role.name}"
    count = "${length(var.iam_policies)}"
    policy_arn = "${var.iam_policies[count.index]}"
}

resource "aws_iam_role_policy" "new_policy" {
    role = "${aws_iam_role.role.name}"
    policy = "${var.new_policy}"
}