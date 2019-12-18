// Global Variables
// Local creds profile name
variable "creds_profile" {
    default = "{INSERT CREDS NAME}"
}

variable "aws_region" {
    default = "us-east-1"
}

### Name to be applied to db, iam role, profile, etc... (MUST CONTAIN ONLY LOWERCASE ALPHANUMERIC CHARACTERS)
variable "name" {
    default = "{INSERT UNIQUE NAME}"
}

variable "environment" {
    default = ""
}

### Username to be applied to rds instance
variable "username" {
    default = "{INSERT USERNAME}"
}

### Password to be applied to rds instance
variable "password" {
    default = "{INSERT PASSWORD}"
}

### Change to desired storage amount for the rds instance
### Currently set to 20 GB
variable "allocated_storage" {
    default = 20
}

// Desired engine for db (EX: "postgres")
variable "engine" {
    default = "postgres"
}

### Instance type (EX: db.t2.small)
variable "instance_class" {
    default = "{INSERT INSTANCE TYPE}"
}

// Which DNS zone to use
variable "hosted_zone" {
    default = ""
}

// Parameter group for rds db
variable "parameter_group_name" {
    default = ""
}