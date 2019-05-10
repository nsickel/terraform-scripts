#### description

This module is able to manage an AWS IAM group and user assignments. It is possible to assign policies either via arn or with self-defined policy files.

#### variables

- iam_role: map containing main iam role data
- specific_policy_attachments: array containing maps with self defined policies
- arn_policy_attachments: array containing pre defined policy arns

[example](../../../examples/iam/role-with-policies)