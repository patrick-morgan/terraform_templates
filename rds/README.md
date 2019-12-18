# Terraform RDS Template

This is a template to be utilized when a RDS instance is needed.  This document aims to provide all of the information required to launch your own RDS instance.

After copying the template to your new location, follow these steps:

# Getting Started:

## Variables:
Edit the variables.tf to reflect your RDS's information. 

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
    default = "john-dev-rds-test"
}
```

#### Variables that MUST be updated:
`name`
`username`
`password`
`allocated_storage`
`instance_class`

#### Variables that must also be updated if using prod
`environment`
`hosted_zone`
`parameter_group_name`


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

### Build:
`terraform plan -out="{MY PLAN NAME}"`

`terraform apply "{MY PLAN NAME}"`

### Teardown:
`terraform destroy`

### Prerequisites

* Terraform v0.12+