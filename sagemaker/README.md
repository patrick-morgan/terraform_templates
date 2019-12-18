# Sagemaker
This repository holds all sagemaker related terraform code.

## How to create a sagemaker notebook:

1. Clone this repo.
2. Change into the `sagemaker` directory
2. Edit the variables.tf file:
    -The following values must be changed to run the stack: `name`, `environment`, `instance_type`
3. Change the state in main.tf
4. Once the above is verified, check again to make sure you changed the state
5. If you actually changed the state... You may now proceed to the next step

### To create stack
```
terraform init
terraform plan -out="planName"
terraform apply planName
```

### Teardown
```
terraform destroy
```

## Always verify what you are creating or destroying before typing `yes`
