resource "aws_autoscaling_policy" "ec2-policy-scaledown" {
    name = "${var.name}-cpu-policy-scaledown"
    autoscaling_group_name = "${aws_autoscaling_group.ec2.name}"
    adjustment_type = "ChangeInCapacity"
    scaling_adjustment = -1
    cooldown = "300"
}

resource "aws_cloudwatch_metric_alarm" "ec2-cpu-alarm-scaledown" {
  alarm_name          = "${var.name}-cpu-alarm-scaledown"
  alarm_description   = "${var.name}-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "12"
 
  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.ec2.name}"
  }
 
  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.ec2-policy-scaledown.arn}"]
}