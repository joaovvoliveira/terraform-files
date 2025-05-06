module "alb" {
  source = "terraform-aws-modules/alb/aws"
  version = "9.7.0"
  subnets = var.public_subnets
  name    = "${random_string.random_name.result}-alb"
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb_sg.id]

  enable_deletion_protection = true

  # Security Group
  security_group_ingress_rules = {
    all_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "HTTP web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    all_https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "HTTPS web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "10.0.0.0/16"
    }
  }

  access_logs = {
    bucket = "my-alb-logs"
  }

  listeners = {
    ex-http-https-redirect = {
      port     = 80
      protocol = "HTTP"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
    ex-https = {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = "arn:aws:acm:us-east-1:296062556421:certificate/b9114ae3-9060-4909-9921-23e67811d6ed"

      forward = {
        target_group_key = "ex-instance"
      }
    }
  }

  target_groups = {
    ex-instance = {
      name_prefix      = "h1"
      protocol         = "HTTP"
      port             = 80
      target_type      = "instance"
      target_id        = "i-0f6d38a07d50d080f"
      vpc_id           = var.vpc_id
    }
  }
}

resource "aws_lb" "this" {
  name               = var.name
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection

  tags = var.tags
}

resource "random_string" "random_name" {
  length  = 16
  upper   = false
  lower   = true
  special = false
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security Group for ALB"
  vpc_id      = var.vpc_id

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

resource "aws_lb_target_group" "this" {
  vpc_id      = var.vpc_id
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
}
# 