variable "name" {}
variable "subnets" {
  type = list(string)
}
variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "security_groups" {
  type = list(string)
}
variable "load_balancer_type" {
  default = "application"
}
variable "enable_deletion_protection" {
  default = false
}
variable "tags" {
  type = map(string)
}
variable "vpc_id" {
  type = string
}

variable "domain_name" {
  description = "The domain name for ACM Certificate"
  type        = string
}

