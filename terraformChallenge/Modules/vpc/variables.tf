variable "tags_vpc" {
  type = map(string)
  default = {
    Terraform   = "true"
    Iac         = true
    Environment = "study"
    Owner       = "Victor"
    Project     = "terraformChallenge"
  }
}

variable "cidr_block" {
    type = string
}