# ---------------------------------------------------------------------------------------------------------------------
# DEFINE SAGEMAKER NOTEBOOOK
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_sagemaker_notebook_instance" "ml" {
  name = "${var.name}-${var.environment}"
  role_arn = "${aws_iam_role.role.arn}"
  instance_type = "${var.instance_type}"
  security_groups = "${var.security_groups}"
  subnet_id = "${local.subnet_ids_list[0]}"
}