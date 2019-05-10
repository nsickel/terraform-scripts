variable "group_name" {
  type = "string"
  default = ""
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

variable "group_users" {
  type = "list"
}
