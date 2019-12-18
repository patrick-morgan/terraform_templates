resource "aws_autoscaling_policy" "ec2-policy-scaleup" {
    name = "${var.name}-cpu-policy-scaleup"
    autoscaling_group_name = "${aws_autoscaling_group.ec2.name}"
    adjustment_type = "ChangeInCapacity"
    scaling_adjustment = 1
    cooldown = "300"
}

resource "aws_cloudwatch_metric_alarm" "ec2-cpu-alarm-scaleup" {
  alarm_name          = "${var.name}-cpu-alarm-scaleup"
  alarm_description   = "${var.name}-cpu-alarm-scaleup"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
 
  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.ec2.name}"
  }
 
  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.ec2-policy-scaleup.arn}"]
}