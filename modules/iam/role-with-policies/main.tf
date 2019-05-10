# creation of iam role
resource "aws_iam_role" "iam_role" {
  name = "${var.iam_role["name"]}"
  assume_role_policy = "${var.iam_role["assume_role_policy"]}"
}

# add provided policies by arn
resource "aws_iam_role_policy_attachment" "arn_policy_attachments" {
  count = "${length(var.arn_policy_attachments)}"
  policy_arn = "${element(var.arn_policy_attachments, count.index)}"
  role = "${aws_iam_role.iam_role.name}"
}

# create specificly provided role policies
resource "aws_iam_role_policy" "specific_policy_attachments" {
  count = "${length(var.specific_policy_attachments)}"

  role = "${aws_iam_role.iam_role.id}"

  policy = "${lookup(var.specific_policy_attachments[count.index], "policy_json")}"
  name = "${lookup(var.specific_policy_attachments[count.index], "policy_name")}"
}
