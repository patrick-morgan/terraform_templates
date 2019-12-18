################################################################################################################
# CREATES A REDIS INSTANCE WITH CLUSTER MODE DISABLED
################################################################################################################

// Cluster mode is disabled
// To create a single shard primary with single read replica
resource "aws_elasticache_replication_group" "rep-group" {
    replication_group_id = "${var.replication_group_name}"
    replication_group_description = "${var.replication_group_description}"
    node_type = "${var.node_type}"
    number_cache_clusters = "${var.number_cache_clusters}"
    parameter_group_name = "${var.parameter_group_name}"
    engine = "redis"
    engine_version = "${var.engine_version}"
    automatic_failover_enabled = "${var.automatic_failover_enabled}"
    at_rest_encryption_enabled = true
    
    security_group_ids = ["${aws_security_group.redis.id}"]
    subnet_group_name = "${aws_elasticache_subnet_group.group.name}"
    port = "${var.port}"

    snapshot_window = "${var.snapshot_window}"
    snapshot_retention_limit = "${var.snapshot_retention_limit}"
    maintenance_window = "${var.maintenance_window}"
    notification_topic_arn = "${var.notification_topic_arn}"
    
    lifecycle {
        ignore_changes = ["number_cache_clusters"]
    }
}