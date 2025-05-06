module "s3" {
  source = "./modules/s3"
  # ... other arguments
}


module "ec2" {
  source = "./Modules/ec2"

  depends_on = [module.s3]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  # ...suas configurações...
}

module "alb" {
  source  = "./Modules/alb"
  name    = "meu-alb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  certificate_domain = "exemplo.com" # ou qualquer valor dummy


  security_groups = [aws_security_group.alb_sg.id]
  load_balancer_type       = "application"
  enable_deletion_protection = true
  domain_name = module.s3.bucket_domain_name  

  tags = {                      
    Terraform   = "true"
    Environment = "dev"
  }

    depends_on = [module.s3]
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security Group for ALB"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
