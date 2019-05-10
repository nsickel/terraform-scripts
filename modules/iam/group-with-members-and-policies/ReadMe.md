#### description

This module is able to manage an AWS IAM role and assign policies either via arn or with self-defined policy files.

#### variables

- iam_group: string, name of group
- group_users: array, containing users to create and assign
- specific_policy_attachments: array containing maps with self defined policies
- arn_policy_attachments: array containing pre defined policy arns

[example.tfvars](example.tfvars)