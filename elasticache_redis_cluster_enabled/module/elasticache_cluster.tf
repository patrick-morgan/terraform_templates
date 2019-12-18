################################################################################################################
# CREATES A REDIS INSTANCE WITH CLUSTER MODE ENABLED
################################################################################################################

// REDIS CLUSTER MODE ENABLED
// To create three shards with a primary and a single read replica each
resource "aws_elasticache_replication_group" "cluster" {
    replication_group_id = "${var.replication_group_name}"
    replication_group_description = "${var.replication_group_description}"
    node_type = "${var.node_type}"
    port = "${var.port}"
    parameter_group_name = "${var.parameter_group_name}"
    
    engine = "redis"
    engine_version = "${var.engine_version}"
    
    subnet_group_name = "${aws_elasticache_subnet_group.group.name}"
    security_group_ids = ["${aws_security_group.redis.id}"]
    snapshot_retention_limit = "${var.snapshot_retention_limit}"
    snapshot_window = "${var.snapshot_window}"
    maintenance_window = "${var.maintenance_window}"
    notification_topic_arn = "${var.notification_topic_arn}"
    
    at_rest_encryption_enabled = true
    automatic_failover_enabled = true

    // Automatic failover must be set to true in order to use "cluster_mode"
    cluster_mode {
        replicas_per_node_group = "${var.replicas_per_node_group}"
        num_node_groups = "${var.num_node_groups}"
    }
}