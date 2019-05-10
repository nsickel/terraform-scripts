provider "aws" {
  #access_key = "..."
  #secret_key = "..."
  region = "eu-central-1"
}

module "group_admin" {
  source = "../modules/iam/group-with-members-and-policies"

  group_name = "admin"
  arn_policy_attachments = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
  specific_policy_attachments = []

  group_users = ["john.doe@example.com"]
}

module "group_developer" {
  source = "../modules/iam/group-with-members-and-policies"

  group_name = "developer"
  arn_policy_attachments = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
  ]
  specific_policy_attachments = [
    {
      policy_json = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
      policy_name = "developer-ec2-describe"
    }
  ]

  group_users = ["foo.bar@something.de", "test@test.de"]
}
