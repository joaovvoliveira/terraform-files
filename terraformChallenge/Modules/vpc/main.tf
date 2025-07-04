module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  name = "${random_string.random_name.result}-vpc"
  cidr = "10.0.0.0/16"

  # These subnets will be created in different Availability Zones
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "random_string" "random_name" {
  length  = 16
  upper   = false
  lower   = true
  special = false
}
