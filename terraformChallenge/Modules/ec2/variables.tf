variable "tags_ec2" {
  type = map(string)
  default = {
    Terraform   = "true"
    Iac         = true
    Environment = "study"
    Owner       = "Victor"
    Project     = "terraformChallenge"
  }
}
