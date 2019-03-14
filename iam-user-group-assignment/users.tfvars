groups = ["admin", "developer"]

users = ["john.doe@example.com", "foo.bar@something.de", "test@test.de"]

group_users = {
  "developer" = ["foo.bar@something.de", "test@test.de"]
  "admin" = ["john.doe@example.com"]
}


group_policies = [
  {
    "developer" = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  },
  {
    "developer" = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
  },
  {
    "admin" = "arn:aws:iam::aws:policy/AdministratorAccess"
  }
]
