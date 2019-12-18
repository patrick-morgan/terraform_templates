variable "aws_region" {
    default = "us-east-1"
}

variable "creds_profile" {
    default = ""
}

variable "environment" {
    default = ""
}

// Variables for elasticache cluster
### Name of Redis Cluster
variable "replication_group_name" {
    default = "{INSERT UNIQUE NAME}"
}

### Description of Cluster
variable "replication_group_description" {
    default = "{INSERT DESCRIPTION}"
}

### Node type (EX: "cache.t2.micro")
variable "node_type" {
    default = "{INSERT NODE TYPE}"
}

// Port for redis instance (default = 6379)
variable "port" {
    default = 6379
}

### Name of parameter group to attach to redis instance
variable "parameter_group_name" {
    default = "{INSERT PARAMETER GROUP}"
}

// The number of days snapshots will be saved before being archived
variable "snapshot_retention_limit" {
    // Requires 0 for t2 micro instances
    default = 0
}

// SNS topic to send notifications to
variable "notification_topic_arn" {
    default = ""
}

// Set to EC2 read only, change to different policy if don't want
// read only
variable "policy_attachment" {
    default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

// The number of replica nodes in each node group. Valid values are 0 to 5
variable "replicas_per_node_group" {
    default = 1
}

// The number of node groups (shards) for this Redis replication group
variable "num_node_groups" {
    default = 3
}
