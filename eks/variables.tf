variable "aws_region" {
    default = "us-east-1"
}

variable "creds_profile" {
    default = "{INSERT CREDS}"
}

variable "cluster-name" {
  default = "{INSERT NAME HERE}"
  type    = "string"
}

variable "environment" {
    default = ""
}

// Desired number of ec2 instances
variable "desired_capacity" {
    default = 2
}

// Maximum number of ec2 instances in cluster
variable "max_size" {
    default = 3
}

// Minimum number of ec2 instances in cluster
variable "min_size" {
    default = 1
}

// Instance type of ec2 instances to be launched into cluster
variable "instance_type" {
    default = "m4.large"
}