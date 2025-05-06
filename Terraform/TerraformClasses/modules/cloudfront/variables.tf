variable "bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "origin_id" {
  description = "Origin ID da distribuição CloudFront"
  type        = string
}

variable "cdn_price_class" {
  type        = string
  description = "values: PriceClass_100, PriceClass_200, PriceClass_All"
  default     = "PriceClass_200"
}

variable "cdn_tags" {
  type        = map(string)
  description = "Tags to be applied to the CloudFront distribution"
  default     = {}
}
