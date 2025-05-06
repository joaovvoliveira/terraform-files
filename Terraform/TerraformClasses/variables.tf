variable "org_name" {
  description = "The name of the S3 bucket to create"
  type        = string
  default     = "rocketseat"
}

variable "state_bucket" {
  description = "bucket with State"
  type        = string
  default     = "rocketseat-state-bucket123513"
}