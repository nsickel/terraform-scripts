provider "aws" {
  #access_key = "..."
  #secret_key = "..."
  region = "eu-central-1"
}

resource "aws_iam_user" "user" {
  count = "${length(var.users)}"
  name = "${element(var.users,count.index)}"
}

resource "aws_iam_group" "group" {
  count = "${length(var.groups)}"
  name = "${element(var.groups,count.index)}"
}

resource "aws_iam_group_membership" "group_membership" {
  count = "${length(var.groups)}"
  name  = "${element(var.groups,count.index)}-membership"
  users = "${var.user_groups[element(var.groups,count.index)]}"
  group = "${element(aws_iam_group.group.*.name,count.index)}"
}

output "groups" {
  value = "${aws_iam_group.group.*.name}"
}
