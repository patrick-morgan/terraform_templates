variable "vpc_id" {
    default = ""
}

variable "environment" {
    default = ""
}

variable "name" {
    default = ""
}

variable "instance_type" {
    default = ""
}

variable "assume_services" {
    default = ["sagemaker.amazonaws.com", "s3.amazonaws.com"]
}

variable "security_groups" {
    default = ""
}

variable "iam_policies" {
    default = ""
}

variable "new_policy" {
    default = ""
}