# Terraform Group Creation Template

This is a template to be utilized when a group needs to be created. It provides existing code to create a group, create policies, attach the policies to the group, and add users to the group. 

After copying the template to your new location, follow these steps:

## Getting Started

### Variables:
Edit the variables.tf to reflect your instance's information. 

#### Variables that MUST be changed to deploy the stack:
`group_name`
`policy_attachment_arn`

### State:
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