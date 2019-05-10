provider "aws" {
  #access_key = "..."
  #secret_key = "..."
  region = "eu-central-1"
}

module "role_example" {
  source = "../../../modules/iam/role-with-policies"

  iam_role = {
    name = "my-example-role",
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  }

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
      policy_name = "specific-example-policy"
    }
  ]

  arn_policy_attachments = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]

}