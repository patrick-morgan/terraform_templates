variable "aws_region" {
    default = "us-east-1"
}

variable "creds_profile" {
    default = "{INSERT CREDS}"
}

// Environment
variable "environment" {
    default = ""
}

### Name of Cluster
variable "replication_group_name" {
    default = "{INSERT UNIQUE NAME}"
}

### Description of Cluster
variable "replication_group_description" {
    default = "{INSERT DESCRIPTION}"
}

### Node Type for Each Node in the Cluster (EX: "cache.t2.micro")
variable "node_type" {
    default = "{INSERT NODE TYPE}"
}

### Number of Nodes in the Cluster
variable "number_cache_clusters" {
    default = "{INSERT NUMBER OF NODES}"
}

### Parameter Group to be attached to the cluster
### In order to have cluster mode DISABLED, MUST ATTACH A PARAMETER GROUP WITH CLUSTER MODE DISABLED (EX: default.redis5.0)
variable "parameter_group_name" {
    default = "{INSERT PARAMETER GROUP NAME}"
}

// Port for cluster
variable "port" {
    description = "default port for redis is 6379"
    default = 6379
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

// Set to EC2 read only, change to different policy if don't want read only
variable "policy_attachment" {
    default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}