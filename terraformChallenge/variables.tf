variable "region" {
  default = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-vpc7645"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24"]

}

variable "enable_nat_gateway" {
  default = true
}

variable "tags_s3" {
  type        = map(string)
  description = "Tags for S3 bucket"
  default = {
    "name" = "s3 bucket"
    "env"  = "study"
  }
}
