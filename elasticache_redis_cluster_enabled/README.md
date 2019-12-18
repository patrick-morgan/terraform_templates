# Terraform Elasticache Redis Instance Creation Template

This is a template to be utilized when an elasticache redis instance with clustering ENABLED needs to be created. To create a redis instance with clustering disabled, see the other github folder.

After copying the template to your new location, follow these steps:

## Getting Started

### Variables:
Edit the variables.tf to reflect your instance's information. 
Variables preceded by ### must be changed in order to deploy the stack.

#### Variables that MUST be changed to deploy the stack:
`replication_group_name`
`replication_group_description`
`node_type`
`parameter_group_name`


### State:
Change the s3 path for state storage for your project in the `main.tf` file.  If this doesn't happen, your project may overwrite another project.
```
# backend cannot have any interpolation!
terraform {
  backend "s3" {
    encrypt = true
    bucket = ""
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