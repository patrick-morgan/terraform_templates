resource "aws_lb" "lb" {
    name = "${var.name}-lb-${data.aws_vpc.selected.tags.environment}"
    internal = true
    load_balancer_type = "application"
    security_groups = ["${aws_security_group.ec2.id}"]
    subnets = "${data.aws_subnet_ids.subnets.ids}"

    enable_deletion_protection = false

    tags = {
        Name = "${var.name}-lb-${var.environment}"
    }
}

resource "aws_lb_target_group" "http" {
  name     = "${var.name}-lb-group-${var.environment}"
  port     = ""
  protocol = "HTTP"
  vpc_id   = "${data.aws_vpc.selected.id}"
  
  health_check {
    protocol = "HTTP"
    interval = "300"
    path = "/api/v1/healthcheck"
    healthy_threshold = "5"
    unhealthy_threshold = "2"
    timeout = "5"
    matcher = "200"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = "${var.http_port}"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.http.arn}"
  }
}

data "aws_acm_certificate" "cert" {
  domain = "*.${var.certificate_domain}"
  statuses = ["ISSUED"]
  most_recent = true
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = "${var.https_port}"
  protocol          = "HTTPS"
  ssl_policy        = ""
  certificate_arn   = "${data.aws_acm_certificate.cert.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.http.arn}"
  }
}