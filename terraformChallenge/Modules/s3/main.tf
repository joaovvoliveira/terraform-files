resource "aws_s3_bucket" "bucket" {
    bucket = "${random_string.random_name.result}-bucket-${terraform.workspace}"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  # The name of the bucket. If omitted, this provider will assign a random, unique name.
  bucket = aws_s3_bucket.bucket.id
  # The versioning configuration block. If omitted, this provider will assign a random, unique name.
  # For more information, see: https://www.terraform.io/docs/providers/aws/r/s3_bucket_versioning.html#versioning_configuration
  versioning_configuration {
    status = "Enabled"
  }
}

resource "random_string" "random_name" {
  length  = 16
  upper   = false
  lower   = true
  special = false
}
