module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  name = "${random_string.random_name.result}-instance-${terraform.workspace}"

  instance_type          = "t2.micro"
  key_name               = "victor-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-0169c99bf4d715390"]
  subnet_id              = "subnet-0b03e6dcbce443d0d"

  tags = var.tags_ec2
}

resource "random_string" "random_name" {
  length  = 16
  upper   = false
  lower   = true
  special = false
}