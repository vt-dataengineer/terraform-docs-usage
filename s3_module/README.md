<!-- BEGIN_TF_DOCS -->
# Documentation for s3\_module
---------------------------
This Terraform module creates an S3 bucket with optional versioning and server-side encryption.

Features:
- Creates an S3 bucket with specified name and environment tags.
- Optionally enables versioning to keep multiple versions of objects.
- Configures server-side encryption using AES-256 for data protection.

Note:
- Ensure that the bucket name is unique across all existing bucket names in Amazon S3.
- Versioning can be enabled or disabled using the `versioning_enabled` variable.
---
## Table of contents
- [Resources](#Resources)
- [Inputs](#Inputs)
- [Outputs](#Outputs)
- [Example](#Example)
---

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for the S3 bucket (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Enable versioning for the S3 bucket | `bool` | `true` | no |
---

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the S3 bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | The ID of the S3 bucket |
---

## Example
### Example 1: creating a s3 bucket
```hcl
module "s3_bucket_basic" {
  source = "./s3_module"
  bucket_name       = "my-basic-bucket"
  environment       = "dev"
  versioning_enabled = true
}
```
<!-- END_TF_DOCS -->