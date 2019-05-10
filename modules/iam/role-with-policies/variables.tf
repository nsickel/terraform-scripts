variable "iam_role" {
  type = "map"
  default = {
    name = "an_iam_role"
    assume_role_policy = ""
  }
}

variable "arn_policy_attachments" {
  type = "list"
}

variable "specific_policy_attachments" {
  type = "list"
  default = [
    {
      policy_json = "json-parsed-policy"
      policy_name = "name-of-policy"
    }
  ]
}
