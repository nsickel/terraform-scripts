#### iam-user-group-management
This module can be used to create new iam groups and users and attach policies to the groups as well.

#### usage
```
export AWS_ACCESS_ID=${your access key id}
export AWS_SECRET_ACCESS_KEY=${your secret access key}
terraform init
terraform plan -var-file users.tf
terraform apply -var-file users.tf
```