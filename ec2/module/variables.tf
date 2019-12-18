// Global Variables:
// Environment variable (EX: 'dev')
variable "environment" {
    default = ""
}

### Name to precede many different instances (ex: ec2 instance, lb, asg, etc...)
variable "name" {
    default = ""
}

//  Variables for main:
variable "aws_region" {
    default = "us-east-1"
}

variable "creds_profile" {
    default = "{INSERT CREDS}"
}

// Variables for aws_instance:
### Instance_type (ex: t2.micro)
variable "instance_type" {
    default = ""
}

variable "monitoring" {
    default = "false"
}

variable "vpc_id" {
    default = ""
}

// Variables for IAM:
variable "assume_services" {
    default = ["ec2.amazonaws.com", "ssm.amazonaws.com"]
}

// IAM policy set to EC2 read only
variable "policy_attachment" {
    default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

// Variables for autoscaling group:
variable "asg_min_size" {
    default = 1
}

variable "asg_max_size" {
    default = 2
}

// Variables for load balancer:
variable "http_port" {
    default = ""
}

variable "https_port" {
    default = ""
}

variable "certificate_domain" {
    default = ""
}

// Hosted zone location of route53 record
variable "hosted_zone_name" {
    default = ""
}