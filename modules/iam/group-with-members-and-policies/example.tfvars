group_name = "developers"

group_users = ["john.doe@example.com", "foo.bar@something.de"]

specific_policy_attachments = [
  {
    policy_json = "${file(examplePolicy.json)}"
    policy_name = "specific-example-policy"
  }
]

arn_policy_attachments = [
  "arn:aws:iam::aws:policy/AmazonS3FullAccess"
]
