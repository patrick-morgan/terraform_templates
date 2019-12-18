variable "aws_region" {
    default = "us-east-1"
}

variable "creds_profile" {
    default = ""
}

variable "environment" {
    default = ""
}

variable "vpc_id" {
    default = ""
}

// Variables for elasticache cluster
### Cluster name
variable "replication_group_name" {
    default = ""
}

### Cluster description
variable "replication_group_description" {
    default = ""
}

### Node type (EX: "cache.t2.micro")
variable "node_type" {
    default = ""
}

### Port for redis instance (default = 6379)
variable "port" {
    default = ""
}

### Name of parameter group to attach to redis instance
variable "parameter_group_name" {
    default = ""
}

### Redis engine version (EX: "5.0.3")
variable "engine_version" {
    default = "5.0"
}

// What time each day the backup snapshot will be taken (sometime in this window)
variable "snapshot_window" {
    default = ""
}

// The number of days snapshots will be saved before being archived
variable "snapshot_retention_limit" {
    // Requires 0 for t2 micro instances
    default = 0
}

// The maintenance window each week for the redis instance
variable "maintenance_window" {
    default = ""
}

// SNS topic to send notifications to
variable "notification_topic_arn" {
    default = ""
}

variable "assume_services" {
    default = ["ec2.amazonaws.com", "ssm.amazonaws.com"]
}

// Set to EC2 read only, change to different policy if don't want
// read only
variable "policy_attachment" {
    default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

variable "replicas_per_node_group" {
    default = 1
}

variable "num_node_groups" {
    default = 3
}