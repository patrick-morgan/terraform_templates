variable "cluster-name" {
  default = "eks-cluster"
  type    = "string"
}

variable "environment" {
    default = ""
}

variable "subnets_subset" {
    default = ""
}

variable "vpc_id" {
    default = ""
}

variable "desired_capacity" {
    default = 2
}

variable "max_size" {
    default = 3
}

variable "min_size" {
    default = 1
}

variable "instance_type" {
    default = "m4.large"
}