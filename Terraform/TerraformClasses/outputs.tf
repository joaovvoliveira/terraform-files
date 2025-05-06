output "s3_bucket_name" {
  value       = module.s3.bucket_domain_name
  description = "Domain name of the bucket"
  sensitive   = false
}

output "cdn_domain" {
  value       = module.cloudfront.cdn_domain_name
  description = "Domain name of the CloudFront distribution"
  sensitive   = false
}
