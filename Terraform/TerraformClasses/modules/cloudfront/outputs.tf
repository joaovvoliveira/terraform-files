output "cdn_id" {
  value       = data.aws_cloudfront_distribution.cloudfront.id
  description = "Name of the CloudFront distribution"
  sensitive   = false
}

output "cdn_domain_name" {
  value       = data.aws_cloudfront_distribution.cloudfront.domain_name
  description = "Domain name of the CloudFront distribution"
  sensitive   = false
}
