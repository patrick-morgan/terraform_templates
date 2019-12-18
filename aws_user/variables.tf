variable "aws_region" {
  default = "us-east-1"
}

variable "creds_profile" {
  default = "{INSERT CREDS NAME}"
}

// Name of new IAM user
variable "name" {
  default = "{NAME OF USER}"
}

// Name of group (or groups) to add new user to
variable "group_name" {
  default = "{INSET GROUP NAME}"
}

// Base-64 encoded PGP public key, used to encrypt the password which will be decrypted to then send to the user for initial login
variable "pgp_key" {
  default = ""
}
