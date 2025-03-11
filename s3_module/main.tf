/**
 * # Documentation for s3_module
 * ---------------------------
 * This Terraform module creates an S3 bucket with optional versioning and server-side encryption.
 *
 * Features:
 * - Creates an S3 bucket with specified name and environment tags.
 * - Optionally enables versioning to keep multiple versions of objects.
 * - Configures server-side encryption using AES-256 for data protection.
 *
 * Note:
 * - Ensure that the bucket name is unique across all existing bucket names in Amazon S3.
 * - Versioning can be enabled or disabled using the `versioning_enabled` variable.
*/

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}