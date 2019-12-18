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

### Security groups to attach to redis cluster
variable "security_group_ids" {
    description = "security groups to attach to redis cluster"
    default = ""
}

// Variables for elasticache cluster

### REPLICATION GROUP NAME
variable "replication_group_name" {
    default = ""
}

### REPLICATION GROUP DESCRIPTION
variable "replication_group_description" {
    default = ""
}

### NODE TYPE (EX: "cache.t2.micro")
variable "node_type" {
    default = "cache.t2.micro"
}

### NUMBER CACHE CLUSTERS
variable "number_cache_clusters" {
    default = ""
}

### ATTACH DESIRED PARAMETER GROUP
variable "parameter_group_name" {
    default = ""
}

### INSERT DESIRED ENGINE VERSION (EX: 5.0.3)
variable "engine_version" {
    default = "5.0"
}

variable "automatic_failover_enabled" {
    default = true
}

### INSERT DESIRED PORT
variable "port" {
    description = "default port for redis is 6379"
    default = 6379
}

// When each day the backup snapshot will be taken (sometime in this window)
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