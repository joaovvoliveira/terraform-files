module "s3" {
  source = "./modules/s3"

  s3_tags = {
    Iac = true
  }
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_id          = module.s3.bucket_id
  bucket_domain_name = module.s3.bucket_domain_name
  cdn_price_class    = "PriceClass_200"

  cdn_tags = {
    Iac = true
  }

  depends_on = [
    module.s3
  ]
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "victor-key"

  ec2_tags = {
    Iac = true
  }

  depends_on = [
    module.cloudfront
  ]

}

module "sqs" {
  source     = "terraform-aws-modules/sqs/aws"
  name       = "example"
  create_dlq = true

  tags = {
    Iac = true
  }

  depends_on = [ module.ec2 ]
}

# resource "aws_s3_bucket" "s3_bucket" {
#   bucket = "${var.org_name}-bucket-iac-${terraform.workspace}373563"

#   tags = {
#     Name        = "First-bucket"
#     Iac         = true
#     Owner       = "Victor"
#     Environment = "Development"
#     CreatedAt   = "2023-10-01"
#     CreatedBy   = "Terraform"
#     Version     = "1.0"
#     Context     = "${terraform.workspace}"
#   }
# }

# module "cloudfront" {
#   source = "terraform-aws-modules/cloudfront/aws"
#   version = "~> 3.0"

#   aliases = ["${var.org_name}-bucket-iac-${terraform.workspace}373563"]
#   default_root_object = "index.html"
#   origin_id = "${var.org_name}-bucket-iac-${terraform.workspace}373563"
#   price_class = "PriceClass_All"
#   enabled = true
#   is_ipv6_enabled = true
#   wait_for_deployment = true

#   tags = {
#     Name        = "First-cloudfront"
#     Iac         = true
#     Owner       = "Victor"
#     Environment = "Development"
#     CreatedAt   = "2023-10-01"
#     CreatedBy   = "Terraform"
#     Version     = "1.0"
#     Context     = "${terraform.workspace}"
#   }

# }
