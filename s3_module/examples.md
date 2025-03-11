### Example 1: creating a s3 bucket
```hcl
module "s3_bucket_basic" {
  source = "./s3_module"
  bucket_name       = "my-basic-bucket"
  environment       = "dev"
  versioning_enabled = true
}
```
