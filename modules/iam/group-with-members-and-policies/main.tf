# create group
resource "aws_iam_group" "group" {
  name  = "${var.group_name}"
}

# add policies attached by arn
resource "aws_iam_group_policy_attachment" "policy_arn_attachments" {
  count = "${length(var.arn_policy_attachments)}"
  group = "${aws_iam_group.group.name}"
  policy_arn = "${element(var.arn_policy_attachments,count.index)}"
}

# add specific policies
resource "aws_iam_group_policy" "specific_policy_attachments" {
  count = "${length(var.specific_policy_attachments)}"

  group = "${aws_iam_group.group.name}"

  policy = "${lookup(var.specific_policy_attachments[count.index], "policy_json")}"
  name = "${lookup(var.specific_policy_attachments[count.index], "policy_name")}"
}

# create users
resource "aws_iam_user" "user" {
  count = "${length(var.group_users)}"
  name  = "${element(var.group_users,count.index)}"
}

# add users to groups
resource "aws_iam_group_membership" "group_membership" {
  #count = "${length(var.group_users)}"
  name  = "${var.group_name}-membership"
  #users= "${element(aws_iam_user.user.,count.index)}"
  users = "${var.group_users}"
  group = "${aws_iam_group.group.name}"
}
