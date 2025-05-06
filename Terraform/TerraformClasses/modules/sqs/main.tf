module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "example"

  create_dlq = true
  redrive_policy = {
    # default is 5 for this module
    maxReceiveCount = 10
  }

  tags = {
    Environment = "dev"
  }
}