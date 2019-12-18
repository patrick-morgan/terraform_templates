# Terraform EC2 Template

This is a template to be utilized when an EC2 instance is needed.  This document aims to provide all of the information required to launch your own EC2 instance.

After copying the template to your new location, follow these steps:

# Getting Started:

## Variables:
Edit the variables.tf to reflect your instance's information. 

### Variables preceded by a ### comment MUST be updated to run the stack
Example: 
```
variable "name" {
    default = "{INSERT NAME}"
}
```

Replace `{INSERT NAME}`

Result:
```
variable "name" {
    default = "john-dev-ec2-test"
}
```

Variables one must update or else stack will not run:
`instance_name`
`instance_type`

## State:
Change the s3 path for state storage for your project.  If this doesn't happen, your project may overwrite another project.
```
# backend cannot have any interpolation!
terraform {
  backend "s3" {
    encrypt = true
    bucket = "{INSERT BUCKET NAME}"
    region = "us-east-1"
    key = ""
  }
}
```

## Build:
`terraform plan -out="{MY PLAN NAME}"`

`terraform apply "{MY PLAN NAME}"`

## Teardown:
`terraform destroy`

### Prerequisites

* Terraform v0.12+