variable "name" {
    default = ""
}

variable "environment" {
    default = ""
}

variable "username" {
    default = ""
}

variable "password" {
    default = ""
}

variable "identifier" {
    default = ""
}

variable "aws_region" {
    default = "us-east-1"
}

variable "allocated_storage" {
    default = "20"
}

variable "engine" {
    default = "postgres"
}

variable "engine_version" {
    default = "9.4"
}

variable "instance_class" {
    default = ""
}

variable "maintenance_window" {
    default = ""
}

variable "backup_window" {
    description = "AWS creates a snapshot sometime in this window (if backups are enabled)"
    default = ""
}

variable "backup_retention_period" {
    description = "The number of days that AWS will save backups for"
    default = 0
}

variable "skip_final_snapshot" {
    default = true
}

variable "security_group_ids" {
    default = []
}

variable "allow_major_version_upgrade" {
    default = false
}

variable "hosted_zone" {
    default = ""
}

variable "parameter_group_name" {
    default = ""
}

variable "db_subnet_group_name" {
    default = ""
}

variable "subnet_ids" {
    default = ""
}

variable "vpc_id" {
    default = ""
}

variable "route53_zone_id" {
    default = ""
}