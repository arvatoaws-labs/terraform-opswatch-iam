# terraform-module-opswatch-iam
This module creates an IAM role for OpsWatch metrics enrichment AWS API call authorization
# TF Module Documentation
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.opswatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.describe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_opswatch_role_principal"></a> [opswatch\_role\_principal](#input\_opswatch\_role\_principal) | Who is allowed to assume the role, so where is the OpsWatch instance running | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->    