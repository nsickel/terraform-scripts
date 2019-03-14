provider "aws" {
  #access_key = "..."
  #secret_key = "..."
  region = "eu-central-1"
}

# create groups
resource "aws_iam_group" "group" {
  count = "${length(var.groups)}"
  name  = "${element(var.groups,count.index)}"
}

# attach policies to groups
resource "aws_iam_group_policy_attachment" "group_policy" {
  count       = "${length(var.group_policies)}"
  group       = "${element(aws_iam_group.group.*.name,index(var.groups,element(keys(var.group_policies[count.index]),0)))}"
  policy_arn  = "${element(values(var.group_policies[count.index]),0)}"
}

# create users
resource "aws_iam_user" "user" {
  count = "${length(var.users)}"
  name  = "${element(var.users,count.index)}"
}

# add users to groups
resource "aws_iam_group_membership" "group_membership" {
  count = "${length(var.groups)}"
  name  = "${element(var.groups,count.index)}-membership"
  users = "${var.group_users[element(var.groups,count.index)]}"
  group = "${element(aws_iam_group.group.*.name,count.index)}"
}

output "groups" {
  value = "${aws_iam_group.group.*.name}"
}
