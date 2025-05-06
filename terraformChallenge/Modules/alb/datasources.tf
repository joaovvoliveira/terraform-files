data "aws_acm_certificate" "certificate" {
  count  = var.certificate_domain != "" ? 1 : 0
  domain = var.certificate_domain
  most_recent = true
  statuses    = ["ISSUED"]
}
