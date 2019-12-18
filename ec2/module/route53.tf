resource "aws_route53_record" "lb" {
    zone_id = "${data.aws_route53_zone.dev.id}"
    name = "${var.name}.${var.hosted_zone_name}"
    type = "A"

    alias {
        name = "${aws_lb.lb.dns_name}"
        zone_id = "${data.aws_elb_hosted_zone_id.zone.id}"
        evaluate_target_health = false
    }
}

data "aws_route53_zone" "dev" {
    name = "${var.hosted_zone_name}"
    private_zone = false
}