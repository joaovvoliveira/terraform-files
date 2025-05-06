module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 5.0"
  name                   = "${var.org_name}-${terraform.workspace}-instance"
  instance_type          = "t2.micro"
  key_name               = "victor-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-0169c99bf4d715390"]
  subnet_id              = "subnet-0b03e6dcbce443d0d"
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Description = "This is my first ec2 created with a Module in Terraform"
    Project     = "Terraform"
    Team        = "DevOps"
  }
}
