variable "org_name" {
  description = "The name of the S3 bucket to create"
  type        = string
  default     = "rocketseat"
}

variable "s3_tags" {
  type        = map(string)
  default     = {}
  description = "Tags to be applied to the S3 bucket"
}
