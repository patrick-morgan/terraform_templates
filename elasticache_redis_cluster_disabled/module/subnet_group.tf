resource "aws_elasticache_subnet_group" "group" {
    name = "${var.replication_group_name}-redis"
    subnet_ids = "${data.aws_subnet_ids.private.ids}"
}