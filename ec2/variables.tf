// Global Variables:
variable "aws_region" {
    default = "us-east-1"
}

variable "creds_profile" {
    default = "{INSERT CREDS NAME}"
}

// Environment variable (EX: 'dev')
variable "environment" {
    default = ""
}

### Name to precede many different instances (ex: ec2 instance, lb, asg, etc...)
variable "instance_name" {
    default = "{INSERT UNIQUE INSTANCE NAME}"
}

### Instance_type (ex: t2.micro)
variable "instance_type" {
    default = "{INSERT INSTANCE TYPE}"
}

// IAM policy set to EC2 read only
variable "policy_attachment" {
    default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

// Minimum number of instances in autoscaling group
variable "asg_min_size" {
    default = 1
}

// Maximum number of instances in autoscaling group
variable "asg_max_size" {
    default = 2
}

// Ports for load balance listener:
variable "http_port" {
    default = ""
}

variable "https_port" {
    default = ""
}

// Hosted zone location of route53 record
variable "hosted_zone_name" {
    default = "{INSET HOSTED ZONE NAME}"
}