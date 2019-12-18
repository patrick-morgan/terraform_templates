#READ THIS:
You MUST add the following tag to the vpc the cluster is launched in in order for the nodes to connect to the master node:

 `Key=kubernetes.io/cluster/${var.cluster-name}, Value=shared`


# Terraform EKS Template

This is a template to be utilized when an EKS instance is needed.  This document aims to provide all of the information required to launch your own eks instance.

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
    default = "john-dev-eks-test"
}
```

Variables to change:
`cluster-name`
`environment`
`desired_capacity`
`max_size`
`min_size`
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
`terraform init`

`terraform plan -out="{MY PLAN NAME}"`

`terraform apply "{MY PLAN NAME}"`

## Teardown:
`terraform destroy`

### Prerequisites

* Terraform v0.12+